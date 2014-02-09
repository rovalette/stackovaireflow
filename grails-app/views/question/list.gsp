
<%@ page import="org.isima.stackover.Question" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="top">
	</head>
	<body>
		<div id="list-question" class="content scaffold-list" role="main">

			<h1 class="pagetitle"><g:message code="question.list" default="Question list" /></h1>

			<g:if test="${flash.message}">
			    <div class="message" role="status">${flash.message}</div>
			</g:if>

            <g:if test="${questionInstanceTotal > 0}">
                <g:render template="listQuestions"
                          model="[questionInstanceList: questionInstanceList, questionInstanceTotal: questionInstanceTotal]"/>
            </g:if>
            <g:else>
                <span class="label label-default">
                    <g:message code="question.noquestionyet" default="No question yet!"/>
                </span>
            </g:else>
		</div>
	</body>
</html>
