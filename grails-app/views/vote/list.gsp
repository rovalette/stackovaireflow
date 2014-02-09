<%--
  Created by IntelliJ IDEA.
  User: Samuel Morel
  Date: 07/02/14
  Time: 17:26
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="top">
</head>

<body>
<div id="list-question" class="content scaffold-list" role="main">
    <h1 class="pagetitle">
        <g:message code="votes.label" default="Votes" />
    </h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <g:if test="${voteList?.isEmpty()}">
        <span class="label label-default">
            <g:message code="vote.novoteyet" default="No vote Yet!"/>
        </span>
    </g:if>
    <g:else>
        <g:each in="${voteList}" var="vote">
            <g:link action="show" id="${vote.id}">
                <span class="label label-info">
                    ${vote}<span class="badge pull-right">${vote.isPositif}</span>
                </span>
            </g:link>
        </g:each>
    </g:else>
</div>
</body>
</html>