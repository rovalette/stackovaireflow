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
    <title>Bootstrap 101 Template</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap -->
    <link href="${resource(dir:'css/bootstrap', file:'bootstrap.css')}" rel="stylesheet" media="screen">
    <link href="${resource(dir:'js/bootstrap', file:'bootstrap.js')}" type="application/javascript"/>
    <meta name="layout" content="top">
</head>
<body>
<h1>Login</h1>

<g:hasErrors bean="${answerInstance}">
    <ul class="errors" role="alert">
    <g:eachError bean="${answerInstance}" var="error">
        <li ${error.field}<g:message error="${error}"/></li>
    </g:eachError>
    </ul>
</g:hasErrors>

<g:form name="signIn" controller="Author" class="form-horizontal" action="signIn" method="post">
    <div class="control-group">
        <label class="control-label" for="username">Pseudo</label>
        <div class="controls">
            <g:field type="text" name="username" value="${username}" placeholder="Pseudo"/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label" for="password">Mot de passe</label>
        <div class="controls">
            <g:field type="password" name="password" value="${password}" placeholder="Password"/>
        </div>
    </div>
    <div class="control-group">
        <div class="controls">
            <g:actionSubmit class="btn btn-primary" value="Se connecter" action="signIn"/>
            <g:link class="btn btn-default" role="button" controller="author" action="displayIndex">Annuler</g:link>
        </div>
    </div>
    <div class="control-group">
        <div class="controls">
            <g:link controller="Author" action="displayCreateAuthor">s'inscrire</g:link>
        </div>
    </div>
</g:form>

<script src="http://code.jquery.com/jquery.js"></script>
<script src="/stackover/static/js/bootstrap.min.js"></script>
</body>
</html>