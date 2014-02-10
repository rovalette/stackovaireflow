<%@ page import="org.isima.stackover.Question" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="top">
		<g:set var="entityName" value="${message(code: 'question.label', default: 'Question')}" />
		<title>Steak Ovaire flow</title>
	</head>
	<body>
		<div id="create-question" class="content scaffold-create" role="main">
			<h1 class="pagetitle"><g:message code="question.create" default="Create new question" /></h1>
			<g:if test="${flash.message}">
			    <div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:form action="save" >
				<fieldset class="form">
					<g:render template="form"/>
				</fieldset>
				<fieldset class="buttons">
					<g:submitButton name="create"
                                    class="btn btn-primary"
                                    value="${message(code: 'question.submit', default: 'Submit Question')}" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
