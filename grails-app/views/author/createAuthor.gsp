<%--
  Created by IntelliJ IDEA.
  User: rovalette
  Date: 15/01/2014
  Time: 16:02
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Register</title>
    <link href="${resource(dir:'css/bootstrap', file:'bootstrap.css')}" rel="stylesheet" type="text/css"/>
    <link href="${resource(dir:'js/bootstrap' , file:'bootstrap.js' )}" type="application/javascript"   />
</head>

<body>
<h1>Register</h1>

<g:hasErrors bean="${answerInstance}">
    <ul class="errors" role="alert">
        <g:eachError bean="${answerInstance}" var="error">
            <li ${error.field}<g:message error="${error}"/></li>
        </g:eachError>
    </ul>
</g:hasErrors>

<g:form name="createAuthor" controller="Author" class="form-horizontal" action="createAuthor" method="post">
    <div class="control-group">
        <label class="control-label" for="firstname">Prénom</label>
        <div class="controls">
            <g:field type="text" name="firstname" value="${author?.firstname}" placeholder="Prénom"/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label" for="lastname">Nom</label>
        <div class="controls">
            <g:field type="text" name="lastname" value="${author?.lastname}" placeholder="Nom"/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label" for="email">Email</label>
        <div class="controls">
            <g:field type="text" name="email" value="${author?.email}" placeholder="Email"/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label" for="username">Pseudo</label>
        <div class="controls">
            <g:field type="text" name="username" value="${author?.username}" placeholder="Pseudo"/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label" for="password">Mot de passe</label>
        <div class="controls">
            <g:field type="password" name="password" value="${author?.password}" placeholder="Password"/>
        </div>
    </div>
    <div class="control-group">
        <div class="controls">
            <g:actionSubmit value="S'enregistrer" class="btn btn-primary" action="createAuthor"/>
            <g:link class="btn btn-default" role="button" controller="author" action="displayIndex">Annuler</g:link>
        </div>
    </div>
</g:form>
</body>
</html>