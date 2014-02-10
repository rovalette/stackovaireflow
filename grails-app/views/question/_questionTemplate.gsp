<%--
  Created by IntelliJ IDEA.
  User: Samuel Morel
  Date: 06/02/14
  Time: 13:51
--%>

<g:if test="${questionInstance?.title}">
    <li class="fieldcontain">
        <h2>
            <span class="property-value" aria-labelledby="title-label">
                <g:fieldValue bean="${questionInstance}" field="title"/>
            </span>
        </h2>
    </li>
</g:if>

<div class="actions">
    <g:if test="${session["UserId"] && session["UserId"] != questionInstance.author.id}">
            <g:remoteLink controller="Vote"
                          action="addQuestionVote"
                          id="${questionInstance.id}"
                          params="[isPositive:true]"
                          update="score"
                          onFailure="alert('${message code:'vote.alreadyvoted', default:'Already voted!'}')"
                          onSuccess="disableVote(${questionInstance.id})">
                <span class="glyphicon glyphicon-thumbs-up"></span>
            </g:remoteLink>
            <div id="score" class="score">${score}</div>
            <g:remoteLink controller="Vote"
                          action="addQuestionVote"
                          id="${questionInstance.id}"
                          params="[isPositive:false]"
                          update="score"
                          onFailure="alert('${message code:'vote.alreadyvoted', default:'Already voted!'}')"
                          onSuccess="disableVote(${questionInstance.id})">
                <span class="glyphicon glyphicon-thumbs-down"></span>
            </g:remoteLink>
    </g:if>
    <g:else>
        <div id="score" class="score">
            <g:message code="question.score" default="Score"/> : ${score}
        </div>
        <g:remoteLink action="startEdit"
                      id="${questionInstance?.id}"
                      update="questionDisplay">
            <button type="button" class="btn btn-default btn-xs">
                <span class="glyphicon glyphicon-pencil"></span>
                <g:message code="default.button.edit.label"/>
            </button>
        </g:remoteLink>
    </g:else>
</div>
<g:if test="${questionInstance?.content}">
    <li class="fieldcontain">
        <span class="property-value" aria-labelledby="content-label">
            <g:fieldValue bean="${questionInstance}" field="content"/>
        </span>
    </li>
</g:if>

<div class="metadata">
<g:if test="${questionInstance?.date}">
    <li class="fieldcontain">
        <span class="property-value" aria-labelledby="date-label">
            <g:message code="answer.the" default="The"/>
            <g:formatDate date="${questionInstance?.date}" format="dd/MM/yyyy HH:ss"/>
            <g:message code="answer.by" default="By"/>
            <g:link controller="author" action="consult" id="${questionInstance?.author?.id}"><g:fieldValue bean="${questionInstance?.author}" field="username"/></g:link>
        </span>
    </li>
</g:if>
</div>

<g:if test="${questionInstance?.tags}">
    <li class="fieldcontain">
        <span id="tags-label" class="property-label"><g:message code="question.tags.label" default="Tags" /> : </span>
        <g:each in="${questionInstance.tags}" var="t">
            <g:link controller="tag" action="show" id="${t.id}">
                <span class="property-value label label-info" aria-labelledby="tags-label">
                    <g:fieldValue bean="${t}" field="name"/>
                </span>
            </g:link>
            &nbsp;
        </g:each>
    </li>
</g:if>

<g:if test="${questionInstance?.comments}">
    <li class="fieldcontain">
        <span id="comments-label" class="property-label">
            <g:message code="question.comments.label" default="Comments" />
        </span>

        <g:each in="${questionInstance.comments}" var="c">
            <span class="property-value" aria-labelledby="comments-label">
                <g:link controller="comment" action="show" id="${c.id}">
                    ${c?.encodeAsHTML()}
                </g:link>
            </span>
        </g:each>

    </li>
</g:if>