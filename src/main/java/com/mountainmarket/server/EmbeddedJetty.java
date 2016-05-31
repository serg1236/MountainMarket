package com.mountainmarket.server;

import org.apache.tomcat.InstanceManager;
import org.apache.tomcat.SimpleInstanceManager;
import org.eclipse.jetty.annotations.ServletContainerInitializersStarter;
import org.eclipse.jetty.apache.jsp.JettyJasperInitializer;
import org.eclipse.jetty.jsp.JettyJspServlet;
import org.eclipse.jetty.plus.annotation.ContainerInitializer;
import org.eclipse.jetty.server.ConnectionFactory;
import org.eclipse.jetty.server.Server;
import org.eclipse.jetty.server.ServerConnector;
import org.eclipse.jetty.servlet.DefaultServlet;
import org.eclipse.jetty.servlet.FilterHolder;
import org.eclipse.jetty.servlet.ServletHolder;
import org.eclipse.jetty.util.log.JavaUtilLog;
import org.eclipse.jetty.util.log.Log;
import org.eclipse.jetty.webapp.WebAppContext;
import org.springframework.web.context.ContextLoaderListener;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.AnnotationConfigWebApplicationContext;
import org.springframework.web.filter.DelegatingFilterProxy;
import org.springframework.web.multipart.support.MultipartFilter;
import org.springframework.web.servlet.DispatcherServlet;

import javax.servlet.DispatcherType;
import javax.servlet.MultipartConfigElement;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.net.*;
import java.util.ArrayList;
import java.util.EnumSet;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * Created by Serg on 5/10/2016.
 */
public class EmbeddedJetty {

    private static final String WEBROOT_INDEX = "/webapp/";
    private static final String CONFIG_LOCATION = "com.mountainmarket.servlet";
    private static final String DEFAULT_PROFILE = "dev";

    public static void main(String[] args) throws Exception {
        System.getProperties().setProperty("dbConfig", args[0]);
        int port = 8080;
        Log.setLog(new JavaUtilLog());

        EmbeddedJetty main = new EmbeddedJetty(port);
        main.start();
        main.waitForInterrupt();
    }

    private static final Logger LOG = Logger.getLogger(EmbeddedJetty.class.getName());

    private int port;
    private Server server;
    private URI serverURI;

    public EmbeddedJetty(int port) {
        this.port = port;
    }

    public URI getServerURI() {
        return serverURI;
    }

    public void start() throws Exception {
        server = new Server();
        ServerConnector connector = connector();
        server.addConnector(connector);

        URI baseUri = getWebRootResourceUri();

        System.setProperty("org.apache.jasper.compiler.disablejsr199", "false");

        WebAppContext webAppContext = getWebAppContext(baseUri, getScratchDir());

        server.setHandler(webAppContext);

        server.start();

        if (LOG.isLoggable(Level.FINE)) {
            LOG.fine(server.dump());
        }
        this.serverURI = getServerUri(connector);
    }

    private ServerConnector connector() {
        ServerConnector connector = new ServerConnector(server);
        connector.setPort(port);
        return connector;
    }

    private URI getWebRootResourceUri() throws FileNotFoundException, URISyntaxException {
        URL indexUri = this.getClass().getResource(WEBROOT_INDEX);
        if (indexUri == null) {
            throw new FileNotFoundException("Unable to find resource " + WEBROOT_INDEX);
        }
        return indexUri.toURI();
    }

    private File getScratchDir() throws IOException {
        File tempDir = new File(System.getProperty("java.io.tmpdir"));
        File scratchDir = new File(tempDir.toString(), "embedded-jetty-jsp");

        if (!scratchDir.exists()) {
            if (!scratchDir.mkdirs()) {
                throw new IOException("Unable to create scratch directory: " + scratchDir);
            }
        }
        return scratchDir;
    }


    private WebAppContext getWebAppContext(URI baseUri, File scratchDir) {
        WebApplicationContext springContext = getContext();
        WebAppContext context = new WebAppContext();
        context.setContextPath("/");
        context.setAttribute("javax.servlet.context.tempdir", scratchDir);
/*        context.setAttribute("org.eclipse.jetty.server.webapp.ContainerIncludeJarPattern",
                ".*//*[^/]*servlet-api-[^/]*\\.jar$|.*//*javax.servlet.jsp.jstl-.*\\.jar$|.*//*.*taglibs.*\\.jar$");*/
        context.setAttribute("org.eclipse.jetty.server.webapp.ContainerIncludeJarPattern",
                ".*jar$|.*/classes/.*");
        context.setResourceBase(baseUri.toASCIIString());
        context.setAttribute("org.eclipse.jetty.containerInitializers", jspInitializers());
        context.setAttribute(InstanceManager.class.getName(), new SimpleInstanceManager());
        context.addBean(new ServletContainerInitializersStarter(context), true);
        context.setClassLoader(getUrlClassLoader());
        context.addServlet(new ServletHolder(new DispatcherServlet(springContext)), "/");
        context.addEventListener(new ContextLoaderListener(springContext));
        context.addServlet(jspServletHolder(), "*.jsp");
        context.addFilter(new FilterHolder(new MultipartFilter()), "/*", EnumSet.allOf(DispatcherType.class));
        context.addFilter(new FilterHolder(new DelegatingFilterProxy("springSecurityFilterChain")), "/*", EnumSet.allOf(DispatcherType.class));
        return context;
    }

    private List<ContainerInitializer> jspInitializers() {
        JettyJasperInitializer sci = new JettyJasperInitializer();
        ContainerInitializer initializer = new ContainerInitializer(sci, null);
        List<ContainerInitializer> initializers = new ArrayList<ContainerInitializer>();
        initializers.add(initializer);
        return initializers;
    }


    private ClassLoader getUrlClassLoader() {
        URL urlTaglibs = null;
        try {
            urlTaglibs = new File("META-INF").toURI().toURL();
        } catch (MalformedURLException e) {
            e.printStackTrace();
        }
        ClassLoader jspClassLoader = new URLClassLoader(new URL[]{urlTaglibs}, this.getClass().getClassLoader());
        return jspClassLoader;
    }


    private ServletHolder jspServletHolder() {
        ServletHolder holderJsp = new ServletHolder("jsp", JettyJspServlet.class);
        holderJsp.setInitOrder(0);
        holderJsp.setInitParameter("logVerbosityLevel", "DEBUG");
        holderJsp.setInitParameter("fork", "false");
        holderJsp.setInitParameter("xpoweredBy", "false");
        holderJsp.setInitParameter("compilerTargetVM", "1.7");
        holderJsp.setInitParameter("compilerSourceVM", "1.7");
        holderJsp.setInitParameter("keepgenerated", "true");
        return holderJsp;
    }


    private static WebApplicationContext getContext() {
        AnnotationConfigWebApplicationContext context = new AnnotationConfigWebApplicationContext();
        context.setConfigLocation(CONFIG_LOCATION);
        context.getEnvironment().setDefaultProfiles(DEFAULT_PROFILE);
        return context;
    }


    private URI getServerUri(ServerConnector connector) throws URISyntaxException {
        String scheme = "http";
        for (ConnectionFactory connectFactory : connector.getConnectionFactories()) {
            if (connectFactory.getProtocol().equals("SSL-http")) {
                scheme = "https";
            }
        }
        String host = connector.getHost();
        if (host == null) {
            host = "localhost";
        }
        int port = connector.getLocalPort();
        serverURI = new URI(String.format("%s://%s:%d/", scheme, host, port));
        LOG.info("Server URI: " + serverURI);
        return serverURI;
    }

    public void stop() throws Exception {
        server.stop();
    }

    public void waitForInterrupt() throws InterruptedException {
        server.join();
    }
}
