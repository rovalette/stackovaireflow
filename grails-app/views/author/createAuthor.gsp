<%--
  Created by IntelliJ IDEA.
  User: rovalette
  Date: 15/01/2014
  Time: 16:02
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Steak Ovaire Flow</title>
    <link href="${resource(dir:'css/bootstrap', file:'bootstrap.css')}" rel="stylesheet" type="text/css"/>
    <link href="${resource(dir:'js/bootstrap' , file:'bootstrap.js' )}" type="application/javascript"   />
    <meta name="layout" content="top">
</head>

<body>
<h1 class="pagetitle">Register</h1>

<g:hasErrors bean="${answerInstance}">
    <ul class="errors" role="alert">
        <g:eachError bean="${answerInstance}" var="error">
            <li ${error.field}<g:message error="${error}"/></li>
        </g:eachError>
    </ul>
</g:hasErrors>

<g:form name="createAuthor" controller="Author" class="form-horizontal" action="createAuthor" method="post">
    <g:if test="${flash.message}">
        <div class="message alert alert-danger alert-dismissable" role="status">
            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
            ${flash.message}
        </div>
    </g:if>
    <div class="control-group">
        <label class="control-label" for="firstname">Prénom</label>
        <div class="controls">
            <g:field type="text" name="firstname" required="" value="${author?.firstname}" placeholder="Prénom"/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label" for="lastname">Nom</label>
        <div class="controls">
            <g:field type="text" name="lastname" required="" value="${author?.lastname}" placeholder="Nom"/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label" for="email">Email</label>
        <div class="controls">
            <g:field type="text" name="email" required="" value="${author?.email}" placeholder="Email"/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label" for="username">Pseudo</label>
        <div class="controls">
            <g:field type="text" name="username" required="" value="${author?.username}" placeholder="Pseudo"/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label" for="password">Mot de passe</label>
        <div class="controls">
            <g:field type="password" name="password" required="" value="${author?.password}" placeholder="Password"/>
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