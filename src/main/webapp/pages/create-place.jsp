<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Mountain Market</title>
</head>
<body ng-controller="MainCtrl">
    <div id="page" class="no-display">
        <%@include file="partials/header.jsp" %>
        <main class="container">
            <div class="row">
                <div class="col s12 m6">
                    <h3>Add new place</h3>
                    <form id="place-form" method="post" ng-controller="NewPlaceCtrl" action="/add/place">
                        <div class="input-field">
                            <i class="material-icons prefix">label_outline</i>
                            <input id="name" name="name" type="text" ng-model="data.name" ng-change="placeChanged()"
                                oninvalid="setCustomValidity('Please, enter login')" onchange="try{setCustomValidity('')}catch(e){}"  required="true">
                            <label for="name">Login</label>
                        </div>
                        <div class="input-field">
                            <i class="material-icons prefix">comment</i>
                            <input id="description" name="description" type="text" ng-model="data.description" ng-change="placeChanged()"
                                oninvalid="setCustomValidity('Please, enter correct email')" onchange="try{setCustomValidity('')}catch(e){}"  required="true">
                            <label for="description">Email</label>
                        </div>
                        <i class="material-icons prefix">add</i>
                        <input type="file" ngf-select="uploadImage($file)" class="waves-effect waves-light btn-large center-align" accept="image/*">
                        <div class="preloader-wrapper small" ng-class="{active:uploadProgress}" style="vertival-align:center">
                            <div class="spinner-layer spinner-blue-only">
                                <div class="circle-clipper left">
                                    <div class="circle"></div>
                                </div>
                                <div class="gap-patch">
                                    <div class="circle"></div>
                                </div>
                                <div class="circle-clipper right">
                                    <div class="circle"></div>
                                </div>
                            </div>
                        </div>
                        <button class="register-submit btn waves-effect waves-light login" type="submit">Create account
                        </button>


                    </form>
                </div>
            </div>
        </main>
        <%@include file="partials/footer.jsp" %>
    </div>
    <%@include file="partials/preloader.jsp" %>
</body>
</html>