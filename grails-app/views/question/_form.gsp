<%@ page import="org.isima.stackover.Question" %>


<g:if test="${edit?.equals(true)}">
    <g:formRemote name="submitNewAnswer" url="[controller: 'Question', action: 'endEdit']" update="questionDisplay">
       <input type="hidden" name="id" id="id" value="${questionInstance.id}" />
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
            <g:textArea name="content" required="" value="${questionInstance?.content}"/>
        </div>

        <div class="fieldcontain ${hasErrors(bean: questionInstance, field: 'tags', 'error')} ">
            <label for="tags">
                <g:message code="question.tags.label" default="Tags" />
            </label>
            <g:textField style="width: 100%" name="tagList" id="tagList" value="${tagList}"/>
        </div>
        <input type="submit" class="btn btn-primary" value="${message(code:"question.endedit", default:"End edition")}" />
    </g:formRemote>
</g:if>
<g:else>
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
        <g:textArea name="content" required="" value="${questionInstance?.content}"/>
    </div>

    <div class="fieldcontain ${hasErrors(bean: questionInstance, field: 'comments', 'error')} ">

    </div>

    <div class="fieldcontain ${hasErrors(bean: questionInstance, field: 'tags', 'error')} ">
        <label for="tags">
            <g:message code="question.tags.label" default="Tags" />
        </label>
        <g:if test="${questionInstance?.tags}">
            <g:each in="${questionInstance.tags}" var="t">
                <span class="tag"><g:fieldValue name="tags" required="" field="name" bean="${t}"/></span>
            </g:each>
        </g:if>
        <g:textField style="width: 100%" name="tagList" id="tagList" value="${tagList}"/>
    </div>
</g:else>