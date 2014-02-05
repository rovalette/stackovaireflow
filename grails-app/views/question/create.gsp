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
			<h1 class="pagetitle"><g:message code="default.create.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${questionInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${questionInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form action="save" >
				<fieldset class="form">
					<g:render template="form"/>
				</fieldset>
				<fieldset class="buttons">
					<g:submitButton name="create" class="save" value="${message(code: 'default.button.submit.label', default: 'Submit Question')}" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
