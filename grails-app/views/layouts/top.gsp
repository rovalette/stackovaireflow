<%--
  Created by IntelliJ IDEA.
  User: rovalette
  Date: 04/02/2014
  Time: 10:39
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title><g:layoutTitle default="StackOvaire"/></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'bootstrap/bootstrap.css')}" type="text/css">
    <g:layoutHead />
    <r:layoutResources />
</head>

<body>
<div class="nav-header">
    <h1>StackOver</h1>
    <g:if test="${username}">
        <g:link class="btn btn-primary" role="button" controller="Author" action="displayEditAuthorInfo" params="[username: username]">Editer vos informations</g:link>
        <g:link class="btn btn-primary" role="button" controller="Question" action="create" params="[username: username]">Ask Question</g:link>
    </g:if>
    <g:else>
        <g:link class="btn btn-default" role="button" controller="Author" action="index">Se connecter</g:link>
        <g:link class="btn btn-primary" role="button" controller="Author" action="displayCreateAuthor">S'enregistrer</g:link>
    </g:else>
</div>

<g:layoutBody/>

<g:javascript library="application"/>
<r:layoutResources />
</body>
</html>