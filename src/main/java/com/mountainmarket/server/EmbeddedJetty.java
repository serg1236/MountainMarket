package com.mountainmarket.server;

import org.apache.jasper.servlet.JspServlet;
import org.eclipse.jetty.annotations.ServletContainerInitializersStarter;
import org.eclipse.jetty.apache.jsp.JettyJasperInitializer;
import org.eclipse.jetty.plus.annotation.ContainerInitializer;
import org.eclipse.jetty.server.Server;
import org.eclipse.jetty.servlet.ServletContextHandler;
import org.eclipse.jetty.servlet.ServletHolder;
import org.eclipse.jetty.util.log.JavaUtilLog;
import org.eclipse.jetty.util.log.Log;
import org.eclipse.jetty.util.log.LoggerLog;
import org.eclipse.jetty.util.log.StdErrLog;
import org.eclipse.jetty.webapp.WebAppContext;
import org.springframework.core.io.ClassPathResource;
import org.springframework.web.context.ContextLoaderListener;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.AnnotationConfigWebApplicationContext;
import org.springframework.web.servlet.DispatcherServlet;

import java.io.IOException;
import java.net.URL;
import java.net.URLClassLoader;
import java.util.ArrayList;
import java.util.List;

public class EmbeddedJetty {

    private static final int DEFAULT_PORT = 8080;
    private static final String CONTEXT_PATH = "/";
    private static final String CONFIG_LOCATION = "com.mountainmarket.servlet";
    private static final String MAPPING_URL = "/";
    private static final String DEFAULT_PROFILE = "dev";

    public static void main(String[] args) throws Exception {
    	System.getProperties().setProperty("dbConfig", args[0]);
        new EmbeddedJetty().startJetty(getPortFromArgs(args));
    }

    private static int getPortFromArgs(String[] args) {
        if (args.length > 1) {
            try {
                return Integer.valueOf(args[1]);
            } catch (NumberFormatException ignore) {
            }
        }
        return DEFAULT_PORT;
    }

    private void startJetty(int port) throws Exception {
    	Log.setLog(new StdErrLog());
        Server server = new Server(port);
        server.setHandler(getServletContextHandler(getContext()));
        server.start();
        server.join();
    }

    private static ServletContextHandler getServletContextHandler(WebApplicationContext context) throws IOException {
        WebAppContext webAppContext = new WebAppContext();
        webAppContext.setErrorHandler(null);
        webAppContext.setContextPath(CONTEXT_PATH);
        webAppContext.addServlet(new ServletHolder(new DispatcherServlet(context)), MAPPING_URL);
        webAppContext.addEventListener(new ContextLoaderListener(context));
        webAppContext.setResourceBase(new ClassPathResource("webapp").getURI().toString());
        setupJspHandler(webAppContext);
        return webAppContext;
    }

    private static WebApplicationContext getContext() {
        AnnotationConfigWebApplicationContext context = new AnnotationConfigWebApplicationContext();
        context.setConfigLocation(CONFIG_LOCATION);
        context.getEnvironment().setDefaultProfiles(DEFAULT_PROFILE);
        return context;
    }

    private static void setupJspHandler(WebAppContext context) {

        //Ensure the jsp engine is initialized correctly
        JettyJasperInitializer sci = new JettyJasperInitializer();

        ServletContainerInitializersStarter sciStarter = new ServletContainerInitializersStarter(context);
        ContainerInitializer initializer = new ContainerInitializer(sci, null);
        List<ContainerInitializer> initializers = new ArrayList<ContainerInitializer>();
        initializers.add(initializer);
        context.setAttribute("org.eclipse.jetty.containerInitializers", initializers);
        context.addBean(sciStarter, true);

        // Set Classloader of Context to be sane (needed for JSTL)
        // JSP requires a non-System classloader, this simply wraps the
        // embedded System classloader in a way that makes it suitable
        // for JSP to use
        //ClassLoader jspClassLoader = new URLClassLoader(new URL[0], EmbeddedJetty.class.getClassLoader());
        //context.setClassLoader(jspClassLoader);

        // Add JSP Servlet (must be named "jsp")
        ServletHolder holderJsp = new ServletHolder("jsp",JspServlet.class);
        holderJsp.setInitOrder(0);
        holderJsp.setInitParameter("logVerbosityLevel","INFO");
        holderJsp.setInitParameter("fork","false");
        holderJsp.setInitParameter("xpoweredBy","false");
        holderJsp.setInitParameter("compilerTargetVM","1.8");
        holderJsp.setInitParameter("compilerSourceVM","1.8");
        holderJsp.setInitParameter("keepgenerated","true");
        context.addServlet(holderJsp, "*.jsp");
    }

}