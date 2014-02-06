<%--
  Created by IntelliJ IDEA.
  User: Samuel Morel
  Date: 06/02/14
  Time: 13:51
--%>

<g:if test="${questionInstance?.title}">
    <li class="fieldcontain">
        <span class="property-value" aria-labelledby="title-label"><g:fieldValue bean="${questionInstance}" field="title"/></span>
    </li>
</g:if>

<g:if test="${questionInstance?.content}">
    <li class="fieldcontain">
        <span class="property-value" aria-labelledby="content-label"><g:fieldValue bean="${questionInstance}" field="content"/></span>
    </li>
</g:if>

<g:if test="${questionInstance?.date}">
    <li class="fieldcontain">
        <span class="property-value" aria-labelledby="date-label">Le <g:formatDate date="${questionInstance?.date}" format="dd/MM/yyyy HH:ss"/> par ${questionInstance.author.username}</span>

    </li>
</g:if>

<g:if test="${questionInstance?.tags}">
    <li class="fieldcontain">
        <span id="tags-label" class="property-label"><g:message code="question.tags.label" default="Tags" /> : </span>
        <g:each in="${questionInstance.tags}" var="t">
            <span class="property-value label label-info" aria-labelledby="tags-label"><g:fieldValue bean="${t}" field="name"/></span>
        </g:each>

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

<g:if test="${edit?.equals(true)}">
    <g:remoteLink action="startEdit" id="${questionInstance?.id}" update="questionDisplay"><g:message code="default.button.edit.label.done" default="Edit" /></g:remoteLink>
</g:if>