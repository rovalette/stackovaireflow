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
    <h1 class="pagetitle"><g:message code="default.tags" default="Tags" /></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <g:if test="${tagList?.isEmpty()}">
        <span class="label label-default"><g:message code="tag.notagyet" default="No Tag Yet!"/></span>
    </g:if>
    <g:else>
        <g:each in="${tagList.sort{a,b -> b.questions.size() <=> a.questions.size()}}" var="tag">
            <g:link action="show" id="${tag.id}">
                <span class="label label-info" style="margin: 10px">
                    ${tag.name}&nbsp;<span class="badge">${tag.questions.size()}</span>
                </span></g:link>
        </g:each>
    </g:else>
    </div>
</body>
</html>