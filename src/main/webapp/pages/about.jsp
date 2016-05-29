<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Mountain Market</title>
    <link rel="stylesheet" href="/styles/about.css"/>
</head>
<body ng-controller="MainCtrl">
    <div id="page" class="no-display">
        <%@include file="partials/header.jsp" %>
        <main class="container">
            <div class="row info">
                <div class="col m6 s12">
                    <h3>This is Mountain Market - your own hutsul guide!:)</h3>
                    <p>We are a small team of enthusiasts who want to share our impressions with the others. We hope you lowe mountains as we do. Join our trips and start to live on a bright side!</p>
                    <p>We provide guiding service for hiking in Carpathian region. The highest and the most popular mountains are in our list as well as many unique and beautiful lakes and rivers</p>
                    <h5><b>Facebook:</b> <a href="www.facebook.com/sergiy.dakhniy">Sergiy D.</a></h5>
                    <h5><b>Email:</b> sergiy.dakhniy@gmail.com</h5>
                    <h5><b>24/7 support:</b> 0 800 777 77 77</h5>
                </div>
                <div class="col m6 s12">
                    <img class="about-img" src="http://res.cloudinary.com/imagine/image/upload/v1464513757/E1uW-BtHe2A_kc5bvk.jpg">
                </div>
            </div>
            <div class="row">
                <div class="col s12">
                    <img class="about-img" src="http://res.cloudinary.com/imagine/image/upload/v1464514541/DSC01234_gg9kzy.jpg">
                </div>
            </div>
        </main>
        <%@include file="partials/footer.jsp" %>
    </div>
    <%@include file="partials/preloader.jsp" %>
</body>
</html>