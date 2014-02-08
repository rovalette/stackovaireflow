
<%@ page import="org.isima.stackover.Question" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="top">
		<g:set var="entityName" value="${message(code: 'question.label', default: 'Question')}" />
	</head>
	<body>
		<div id="list-question" class="content scaffold-list" role="main">

			<h1 class="pagetitle"><g:message code="default.list.label" args="[entityName]" /></h1>

			<g:if test="${flash.message}">
			    <div class="message" role="status">${flash.message}</div>
			</g:if>

            <g:if test="${questionInstanceTotal > 0}">
                <g:render template="listQuestions" model="[questionInstanceList: questionInstanceList, questionInstanceTotal: questionInstanceTotal]"/>
            </g:if>
            <g:else>
                <span class="label label-default"><g:message code="question.noquestionyet" default="No question yet!"/></span>
            </g:else>
		</div>
	</body>
</html>
