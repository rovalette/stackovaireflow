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
    <title>Steak Ovaire Flow</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="layout" content="top">
</head>
<body>
<h1 class="pagetitle">Login</h1>

<g:hasErrors bean="${answerInstance}">
    <ul class="errors" role="alert">
    <g:eachError bean="${answerInstance}" var="error">
        <li ${error.field}<g:message error="${error}"/></li>
    </g:eachError>
    </ul>
</g:hasErrors>

<g:form name="signIn" controller="Author" class="form-horizontal" action="signIn" method="post">
    <g:if test="${flash.message}">
        <div class="message alert alert-danger alert-dismissable" role="status">
            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
            ${flash.message}
        </div>
    </g:if>
    
    <div class="content">
        <div class="centerform">
            <div class="input-group">
                <span class="input-group-addon formlabel">Pseudo</span>
                <div class="form-control">
                    <g:field type="text" name="username" required="" value="${username}" placeholder="Pseudo"/>
                </div>
            </div>
                
            <div class="input-group">
                <span class="input-group-addon formlabel">Mot de passe</span>
                <div class="form-control">
                    <g:field type="password" name="password" required="" value="${password}" placeholder="Password"/>
                </div>
            </div>
                
            <div class="btn-group">
                <g:link class="btn btn-danger" role="button" controller="author" action="displayCreateAuthor">Sign Up for free</g:link>
                <g:actionSubmit class="btn btn-primary" value="Se connecter" action="signIn"/>
                <g:link class="btn btn-default" role="button" controller="author" action="displayIndex">Annuler</g:link>
            </div>
        
        </div>
    </div>
</g:form>

<script src="http://code.jquery.com/jquery.js"></script>
</body>
</html>