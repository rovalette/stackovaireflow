<li id="comment${comment.id}" class="comment">
    <g:if test="${comment?.author?.id == session["UserId"] && objId}">
        <div class="actions">
            <div class="icon left">
            <g:if test="${isQuestion}">
                <g:remoteLink controller="comment" action="deleteQuestionComment" id="${comment?.id}" params="[objId: objId]" update="commentsQuestion${objId}"><span class="glyphicon glyphicon-trash"></span></g:remoteLink>
                <p></p>
                <g:remoteLink controller="comment" action="startEditQuestionComment" id="${comment?.id}" params="[objId: objId]" update="comment${comment.id}"><span class="glyphicon glyphicon-pencil"></span></g:remoteLink>
            </g:if>
            <g:else>
                <g:remoteLink controller="comment" action="deleteAnswerComment" id="${comment?.id}" params="[objId: objId]" update="commentsAnswer${objId}"><span class="glyphicon glyphicon-trash"></span></g:remoteLink>
                <p></p>
                <g:remoteLink controller="comment" action="startEditAnswerComment" id="${comment?.id}" params="[objId: objId]" update="comment${comment.id}"><span class="glyphicon glyphicon-pencil"></span></g:remoteLink>
            </g:else>
            </div>
        </div>
    </g:if>
    <g:fieldValue bean="${comment}" field="content"/>
    <div class="metadata">
        <g:message code="answer.by" default="By"/>
        <g:fieldValue bean="${comment?.author}" field="username"/>
        <g:formatDate format="dd/MM/yyyy HH:mm" date="${comment?.date}"/>
    </div>
</li>