
<%@ page import="org.isima.stackover.Question" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="top">
		<g:set var="entityName" value="${message(code: 'question.label', default: 'Question')}" />
		<title>Steak Ovaire Flow</title>
	</head>
	<body>
		<div id="show-question" class="content scaffold-show" role="main">
			<h1 class="pagetitle"><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
                <div class="message alert alert-success alert-dismissable" role="status">
                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
			        ${flash.message}
                </div>
			</g:if>
			<ul class="property-list question">
                <div id="questionDisplay" class="questionContent">
                    <g:render template="/question/questionTemplate" bean="${questionInstance}" var="questionInstance" model="[edit:true]"/>
                </div>
                <li class="fieldcontain">
                    <span id="anwsers-label" class="property-label"><g:message code="question.answers.label" default="Anwsers" /></span>
                    <ul id="answers" class="answers">
                        <g:render template="/answer/answerTemplate" collection="${questionInstance.answers.sort{it.date}}" var="a"/>
                    </ul>
                </li>
            </ul>

            <g:if test="${session["UserId"]}">
                <g:formRemote name="submitNewAnswer" url="[controller: 'Answer', action: 'save']" update="answers" onComplete="jQuery('#newAnswer').val('')">
                    <input type="hidden" id="qid" name="qid" value="${questionInstance.id}" />
                    <g:textArea style="width:100%; height:25%" id="newAnswer" name="content" required="" placeholder="Your answer"/>
                    <input type="submit" class="btn btn-primary" value="${message(code:"answer.create", default:"Answer this question")}" />
                </g:formRemote >
            </g:if>

            <g:if test="${questionInstance?.author?.id.equals(session["UserId"])}">
                <g:form>
                    <fieldset class="buttons">
                        <g:hiddenField name="id" value="${questionInstance?.id}" />
                        <g:actionSubmit class="btn btn-default" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete topic')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                    </fieldset>
                </g:form>
            </g:if>
		</div>
	</body>
</html>
