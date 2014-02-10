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
    <title>Steak Ovaire Flow</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'bootstrap.css', plugin: 'twitter-bootstrap')}" type="text/css">
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'bootstrap-theme.css', plugin: 'twitter-bootstrap')}" type="text/css">
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'bootstrap-fixtaglib.css', plugin: 'twitter-bootstrap')}" type="text/css">
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'perso.css')}" type="text/css">
    <link rel="icon" type="image/png" href="${resource(dir:'images', file: 'favico.png')}" />
    <g:layoutHead />
    <r:layoutResources />
</head>

<body>
<div id="headband" class="nav-header">
    <h1 class="center" style="color : white; width:255px">StackOvaire<img src="${resource(dir:'/images', file:'favico.png')}" style="width:60px"/></h1>
    <g:link class="btn btn-default" role="button" controller="question" action="list"><g:message code="default.home.label"/></g:link>
    <g:link class="btn btn-default" role="button" controller="tag" action="list"><g:message code="tags.label" default="Tags"/></g:link>
    <g:if test="${session["UserId"]}">
        <g:link class="btn btn-default" role="button" controller="question" action="create"><g:message code="question.askquestion" default="Ask Question"/></g:link>
        <g:link class="btn btn-primary right" role="button" controller="Author" action="consult"><g:message code="author.consultprofile" default="Profile"/></g:link>
        <g:link class="btn btn-primary right" role="button" controller="Author" action="logout"><g:message code="author.logout" default="Log Out"/></g:link>
    </g:if>
    <g:else>
        <g:link class="btn btn-default right" role="button" controller="Author" action="index"><g:message code="topBar.login" default="Sign in"/></g:link>
        <g:link class="btn btn-primary right" role="button" controller="Author" action="displayCreateAuthor"><g:message code="topBar.signup" default="Sign up"/></g:link>
    </g:else>
</div>

<g:layoutBody/>

<g:javascript library="application"/>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script src="${resource(dir:"js", file:"bootstrap-affix.js", plugin: 'twitter-bootstrap')}"></script>
<script src="${resource(dir:"js", file:"bootstrap-alert.js", plugin: 'twitter-bootstrap')}"></script>
<script src="${resource(dir:"js", file:"bootstrap-button.js", plugin: 'twitter-bootstrap')}"></script>
<script src="${resource(dir:"js", file:"bootstrap-carousel.js", plugin: 'twitter-bootstrap')}"></script>
<script src="${resource(dir:"js", file:"bootstrap-collapse.js", plugin: 'twitter-bootstrap')}"></script>
<script src="${resource(dir:"js", file:"bootstrap-dropdown.js", plugin: 'twitter-bootstrap')}"></script>
<script src="${resource(dir:"js", file:"bootstrap-modal.js", plugin: 'twitter-bootstrap')}"></script>
<script src="${resource(dir:"js", file:"bootstrap-popover.js", plugin: 'twitter-bootstrap')}"></script>
<script src="${resource(dir:"js", file:"bootstrap-scrollspy.js", plugin: 'twitter-bootstrap')}"></script>
<script src="${resource(dir:"js", file:"bootstrap-tab.js", plugin: 'twitter-bootstrap')}"></script>
<script src="${resource(dir:"js", file:"bootstrap-tooltip.js", plugin: 'twitter-bootstrap')}"></script>
<script src="${resource(dir:"js", file:"bootstrap-transition.js", plugin: 'twitter-bootstrap')}"></script>
<r:layoutResources />
</body>
</html>