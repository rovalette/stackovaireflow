<%@ page import="org.isima.stackover.Question" %>


<g:if test="${edit?.equals(true)}">
    <g:formRemote name="submitNewAnswer" url="[controller: 'Question', action: 'endEdit']" update="questionDisplay">
       <input type="hidden" name="id" id="id" value="${questionInstance.id}" />
        <div class="form-group">
            <label for="title">
                <g:message code="question.title.label" default="Title" />
                <span class="required-indicator">*</span>
            </label>
            <g:textField style="width:100%" class="form-control"name="title" required="" value="${questionInstance?.title}"/>
        </div>

        <div class="form-group">
            <label for="content">
                <g:message code="question.content.label" default="Content" />
                <span class="required-indicator">*</span>
            </label>
            <g:textArea name="content" class="form-control" required="" value="${questionInstance?.content}"/>
        </div>

        <div class="form-group">
            <label for="tags">
                <g:message code="question.tags.label" default="Tags" />
            </label>
            <g:textField style="width: 100%" class="form-control" name="tagList" id="tagList" value="${tagList}"/>
        </div>
        <input type="submit" class="btn btn-primary" value="${message(code:"question.endedit", default:"End edition")}" />
    </g:formRemote>
</g:if>
<g:else>
    <div class="form-group">
        <label for="title">
            <g:message code="question.title.label" default="Title" />
        </label>
        <g:textField style="width:100%" class="form-control" name="title" required="" value="${questionInstance?.title}"/>
    </div>

    <div class="form-group">
        <label for="content">
            <g:message code="question.content.label" default="Content" />
        </label>
        <g:textArea name="content" class="form-control" required="" value="${questionInstance?.content}"/>
    </div>

    <div class="fieldcontain ${hasErrors(bean: questionInstance, field: 'comments', 'error')} ">

    </div>

    <div class="form-group">
        <label for="tags">
            <g:message code="question.tags.label" default="Tags" />
        </label>
        <g:each in="${questionInstance.tags}" var="t">
            <span class="tag">
                <g:fieldValue class="form-control" name="tags" required="" field="name" bean="${t}"/>
            </span>
        </g:each>
        <g:textField style="width: 100%" class="form-control" name="tagList" id="tagList" value="${tagList}"/>
    </div>
</g:else>