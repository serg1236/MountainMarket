<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
</head>
<body>
    <div id="request-form" class="modal">
        <form method="POST" ng-submit="sendRequest($event)">
            <div class="modal-content">
                <h3>Send us tour request</h3>
                <p>If you cannot find a tour suitable for you, please do not hesitate to tell us about your wishes. Just tell us two things:</p>
                <h5>1. When?</h5>
                <div class="date-range row">
                    <div class="input-field col s6">
                        <input id="reqStartDate" type="text" input-date name="startDate" format="yyyy-mm-dd" ng-model="requestData.startDate" required="true">
                        <label for="reqStartDate">Not earlier than</label>
                    </div>
                    <div class="input-field col s6">
                        <input id="reqEndDate" type="text" input-date format="yyyy-mm-dd" name="endDate" ng-model="requestData.endDate" required="true">
                        <label for="reqEndDate">Not later than</label>
                    </div>
                </div>
                <h5>2. What?</h5>
                <div class="input-field">
                    <textarea name="description" id="reqDescription" class="materialize-textarea" ng-model="requestData.comment"
                        oninvalid="setCustomValidity('Please, enter description')" onchange="try{setCustomValidity('')}catch(e){}"  required="true"></textarea>
                    <label for="description">Describe your dream tour</label>
                </div>
            </div>
            <div class="modal-footer">
                <button class="btn waves-effect waves-light login" type="submit">Send request
                </button>
                <a class="modal-action modal-close waves-effect waves-green btn-flat">Cancel</a>
                <p class="red-text">{{requestError}}</p>
            </div>
        </form>
    </div>
</body>