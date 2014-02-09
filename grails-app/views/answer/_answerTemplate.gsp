<%--
  Created by IntelliJ IDEA.
  User: Samuel Morel
  Date: 06/02/14
  Time: 13:51
--%>

<li id="answer${a.id}" class="answer">
    <g:if test="${session["UserId"] == a?.author?.id}">
        <div class="icon left">
            <g:remoteLink controller="answer" action="delete" id="${a.id}" update="answers"><span class="glyphicon glyphicon-remove"></span></g:remoteLink>
        </div>
    </g:if>
    <g:fieldValue bean="${a}" field="content"/>
    <span class="metadata">
        <g:fieldValue bean="${a.author}" field="username"/>
        <g:formatDate format="dd/MM/yyyy HH:mm" date="${a.date}"/>
    </span>
    <span id="comment-label" class="property-label"><g:message code="answers.comments.label" default="Comments" /></span>
    <ul id="commentsAnswer${a.id}" class="comments">
        <g:render template="/comment/commentTemplate" collection="${a?.comments?.sort{it.date}}" var="comment" model="[objId: a.id]"/>
    </ul>
    <g:if test="${session["UserId"]}">
        <a onclick="$('#addComment${a.id}').show()"><g:message code="comments.add" default="Add comment"/></a>
        <g:formRemote style="display:none" name="addComment${a.id}" url="[controller :'Comment', action:'saveAnswerComment']" update="commentsAnswer${a.id}" onComplete="jQuery('#addComment${a.id}').val='';jQuery('#addComment${a.id}').hide()">
            <input type="hidden" id="objId" name="objId" value="${a.id}" />
            <g:textArea style="width:100%; height:25%" id="newComment${a.id}" name="content" required="" placeholder="Your answer"/>
            <input type="submit" class="btn btn-primary" value="${message(code:"comment.create", default:"Leave this comment")}" />
        </g:formRemote>
    </g:if>
    <g:if test="${edit?.equals(true) && session["UserId"]}">
        <g:remoteLink action="startEdit" id="${a?.id}" update="answer${a.id}">
            <button type="button" class="btn btn-default btn-xs">
                <span class="glyphicon glyphicon-pencil"></span>
                <g:message code="default.button.edit.label"/>
            </button>
        </g:remoteLink>
    </g:if>
</li>