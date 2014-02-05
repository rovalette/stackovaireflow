<%@ page import="org.isima.stackover.Question" %>



<div class="fieldcontain ${hasErrors(bean: questionInstance, field: 'title', 'error')} required">
	<label for="title">
		<g:message code="question.title.label" default="Title" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField style="width:100%" name="title" required="" value="${questionInstance?.title}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: questionInstance, field: 'content', 'error')} required">
	<label for="content">
		<g:message code="question.content.label" default="Content" />
		<span class="required-indicator">*</span>
	</label>
	<g:textArea style="width:100%" name="content" required="" value="${questionInstance?.content}"/>
</div>

<g:if test="${questionInstance?.answers != null && questionInstance?.answers.isEmpty() == false}">
<div class="fieldcontain ${hasErrors(bean: questionInstance, field: 'answers', 'error')} ">
		<g:message code="question.answers.label" default="Answers" />
	
    <ul class="one-to-many">
        <g:each in="${questionInstance?.answers?}" var="a">
            <li><g:message style="width:100%">${a.author}</g:message></li>
            <li><g:message style="width:100%">${a.content}</g:message></li>
            <div class="comments">
                <g:message code="question.comments.label" default="Comments" />
                <g:each in="${a.comments}" var="c">
                    <g:message style="width: 100%">${c.author}</g:message>
                    <g:message style="width: 100%">${c.content}</g:message>
                </g:each>
            </div>
        </g:each>
    </ul>

</div>
</g:if>

<div class="fieldcontain ${hasErrors(bean: questionInstance, field: 'comments', 'error')} ">

</div>

<div class="fieldcontain ${hasErrors(bean: questionInstance, field: 'tags', 'error')} ">
	<label for="tags">
		<g:message code="question.tags.label" default="Tags" />
	</label>
	
</div>

