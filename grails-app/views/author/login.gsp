<%--
  Created by IntelliJ IDEA.
  User: Samuel Morel
  Date: 15/01/14
  Time: 17:02
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="top">
</head>
<body>
<h1 class="pagetitle"><g:message code="author.login" default="Login"/></h1>

<g:form name="signIn" role="form" controller="Author" class="form-horizontal" action="signIn" method="post">
    <g:if test="${flash.message}">
        <div class="message alert alert-danger alert-dismissable" role="status">
            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
            ${flash.message}
        </div>
    </g:if>
    
    <div class="content">
        <div class="centerform" style="padding-top: 15%">
            <div class="form-group">
                <label for="username"><g:message code="author.username" default="Username"/></label>
                <g:field type="text" class="form-control" name="username" required="" value="${username}" placeholder="${message (code:'author.username', default:'Username')}"/>
            </div>

            <div class="form-group">
                <label for="password"><g:message code="author.password" default="Mot de passe"/></label>
                <g:field type="password" class="form-control" name="password" required="" value="${password}" placeholder="${message (code:'author.password', default:'Password')}"/>
            </div>

            <div class="btn-group">
                <g:link class="btn btn-danger" role="button" controller="author" action="displayCreateAuthor"><g:message code="author.signupforfree" default="Sign up for free"/></g:link>
                <g:actionSubmit class="btn btn-primary" value="${message (code:'author.login', default:'Login')}" action="signIn"/>
                <g:link class="btn btn-default" role="button" controller="author" action="displayIndex"><g:message code="default.cancel" default="Cancel"/></g:link>
            </div>
        </div>
    </div>
</g:form>

<script src="http://code.jquery.com/jquery.js"></script>
</body>
</html>