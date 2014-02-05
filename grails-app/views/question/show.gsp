
<%@ page import="org.isima.stackover.Question" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="top">
		<g:set var="entityName" value="${message(code: 'question.label', default: 'Question')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<div id="show-question" class="content scaffold-show" role="main">
			<h1 class="pagetitle"><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ul class="property-list question">
			
				<g:if test="${questionInstance?.title}">
				<li class="fieldcontain">
					<span id="title-label" class="property-label"><g:message code="question.title.label" default="Title" /></span>
					<span class="property-value" aria-labelledby="title-label"><g:fieldValue bean="${questionInstance}" field="title"/></span>
				</li>
				</g:if>
			
				<g:if test="${questionInstance?.content}">
				<li class="fieldcontain">
					<span id="content-label" class="property-label"><g:message code="question.content.label" default="Content" /></span>
				    <span class="property-value" aria-labelledby="content-label"><g:fieldValue bean="${questionInstance}" field="content"/></span>
				</li>
				</g:if>
			
				<g:if test="${questionInstance?.answers && questionInstance.answers.isEmpty() != true}">
				<li class="fieldcontain">
					<span id="anwsers-label" class="property-label"><g:message code="question.answers.label" default="Anwsers" /></span>
                    <ul>
                        <g:each in="${questionInstance.answers}" var="a">
                            <li>
                                <g:fieldValue bean="${a.author}" field="username"/>
                                <g:fieldValue bean="${a}" field="content"/>
                                <g:if test="${a?.comments}">
                                    <div class="comments">
                                        <span id="comment-label" class="property-label"><g:message code="answers.comments.label" default="Comments" /></span>
                                        <ul>
                                            <g:each in="$a?.comments" var="c">
                                                <li>
                                                    <g:fieldValue bean="${c.author}" field="username"/>
                                                    <g:fieldValue bean="${c}" field="content"/>
                                                </li>
                                            </g:each>
                                        </ul>
                                    </div>
                                </g:if>
                            </li>
                        </g:each>
                    </ul>
				</li>
				</g:if>
			
				<g:if test="${questionInstance?.comments}">
				<li class="fieldcontain">
					<span id="comments-label" class="property-label"><g:message code="question.comments.label" default="Comments" /></span>
					
						<g:each in="${questionInstance.comments}" var="c">
						<span class="property-value" aria-labelledby="comments-label"><g:link controller="comment" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${questionInstance?.date}">
				<li class="fieldcontain">
					<span id="date-label" class="property-label"><g:message code="question.date.label" default="Date" /></span>
					
						<span class="property-value" aria-labelledby="date-label"><g:formatDate date="${questionInstance?.date}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${questionInstance?.tags}">
				<li class="fieldcontain">
					<span id="tags-label" class="property-label"><g:message code="question.tags.label" default="Tags" /></span>
					
						<g:each in="${questionInstance.tags}" var="t">
						<span class="property-value" aria-labelledby="tags-label"><g:link controller="tag" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ul>

            <g:link class="btn btn-primary" role="button" controller="Answer" action="create">Answer</g:link>

			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${questionInstance?.id}" />
					<g:link class="edit" action="edit" id="${questionInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
