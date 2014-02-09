<%--
  Created by IntelliJ IDEA.
  User: Samuel Morel
  Date: 07/02/14
  Time: 18:11
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="top">
</head>

<body>
<div id="list-question" class="content scaffold-list" role="main">
    <h1 class="pagetitle"><g:message code="tags.label" default="Tag" /> : ${tag?.name}</h1>
    <g:if test="${tag?.questions?.empty}">
        <span class="label label-warning">
            <g:message code="tag.noquestion" default="No question associated anymore..."/>
        </span>
    </g:if>
    <g:else>
        <h3 class="page-header">
            <g:message code="tag.panelheader" default="Associated questions"/>
        </h3>
        <g:render template="/question/listQuestions"
                  model="[questionInstanceList: tag.questions, questionInstanceTotal: tag.questions.size()]"/>
    </g:else>
</body>
</html>