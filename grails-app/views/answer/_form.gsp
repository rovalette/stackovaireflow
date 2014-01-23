<%@ page import="org.isima.stackover.Answer" %>



<div class="fieldcontain ${hasErrors(bean: answerInstance, field: 'author', 'error')} required">
	<label for="author">
		<g:message code="answer.author.label" default="Author" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="author" name="author.id" from="${org.isima.stackover.Author.list()}" optionKey="id" required="" value="${answerInstance?.author?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: answerInstance, field: 'question', 'error')} required">
	<label for="question">
		<g:message code="answer.question.label" default="Question" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="question" name="question.id" from="${org.isima.stackover.Question.list()}" optionKey="id" required="" value="${answerInstance?.question?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: answerInstance, field: 'content', 'error')} required">
	<label for="content">
		<g:message code="answer.content.label" default="Content" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="content" required="" value="${answerInstance?.content}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: answerInstance, field: 'comments', 'error')} ">
	<label for="comments">
		<g:message code="answer.comments.label" default="Comments" />
		
	</label>
	<g:select name="comments" from="${org.isima.stackover.Comment.list()}" multiple="multiple" optionKey="id" size="5" value="${answerInstance?.comments*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: answerInstance, field: 'date', 'error')} required">
	<label for="date">
		<g:message code="answer.date.label" default="Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="date" precision="day"  value="${answerInstance?.date}"  />
</div>

