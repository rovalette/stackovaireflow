<%--
  Created by IntelliJ IDEA.
  User: Samuel Morel
  Date: 03/02/14
  Time: 22:25
--%>


<%@ page import="org.isima.stackover.Question" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <title>Consult</title>
    <link href="${resource(dir:'css/bootstrap', file:'bootstrap.css')}" rel="stylesheet" type="text/css"/>
    <link href="${resource(dir:'js/bootstrap' , file:'bootstrap.js' )}" type="application/javascript"   />
</head>
<body>
<div id="show-topic" class="content scaffold-show" role="main">
    <!-- title->
    <g:if test="${question?.titile}">
        <span style="border:1px solid">${question?.title}</span>
    </g:if>

    <!-- content ->
    <g:if test="${question?.content}">
        <span style="border:1px solid">${question?.content}</span>
    </g:if>

    <-- answers ->
    <g:if test="${question?.answers}">
        <g:each in="${question?.answers}">
            <span style="border:1px solid">${it.content}</span>
        </g:each>
    </g:if>
    <g:form>
            <g:render template="answerForm"/>
        <g:actionSubmit value="Publish an answer" class="btn btn-primary" action="addAnswer"/>
    </g:form>
</div>
</body>
</html>
