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
    <h1 class="pagetitle"><g:message code="author.list" default="Author list" /></h1>
    <g:if test="${authorList?.isEmpty()}">
        <span class="label label-default">
            <g:message code="author.noauthoryet" default="No Author Yet!"/>
        </span>
    </g:if>
    <g:else>
        <g:each in="${authorList}" var="author">
            <g:link action="consult" id="${author.id}">
                <span class="label label-info" style="margin: 10px">
                    ${author.username}
                </span>
            </g:link>
        </g:each>
    </g:else>
</div>
</body>
</html>