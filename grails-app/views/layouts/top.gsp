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
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'perso.css')}" type="text/css">
    <g:layoutHead />
    <r:layoutResources />
</head>

<body>
<div id="headband" class="nav-header">
    <h1 class="center" style="width: 300px">StackOvaire</h1>
    <g:link class="btn btn-default" role="button" controller="question" action="list"><g:message code="default.home.label"/></g:link>

    <g:if test="${session["UserId"]}">
        <g:link class="btn btn-default" role="button" controller="question" action="create"><g:message code="question.askquestion" default="Ask Question"/></g:link>
        <g:link class="btn btn-primary right" role="button" controller="Author" action="displayEditAuthorInfo"><g:message code="author.editprofile" default="Edit profile"/></g:link>
        <g:link class="btn btn-primary right" role="button" controller="Author" action="logout"><g:message code="author.logout" default="Log Out"/></g:link>
    </g:if>
    <g:else>
        <g:link class="btn btn-default right" role="button" controller="Author" action="index"><g:message code="topBar.login" default="Sign in"/></g:link>
        <g:link class="btn btn-primary right" role="button" controller="Author" action="displayCreateAuthor"><g:message code="topBar.signup" default="Sign up"/></g:link>
    </g:else>
</div>

<g:layoutBody/>

<g:javascript library="application"/>
<r:layoutResources />
</body>
</html>