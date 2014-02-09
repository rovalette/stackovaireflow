<li class="comment">
    <g:if test="${comment?.author?.id == session["UserId"] && objId}">
        <div class="icon left">
        <div class="icon left">
            <g:if test="${isQuestion}">
                <g:remoteLink controller="comment" action="deleteQuestionComment" id="${comment?.id}" params="[objId: objId]" update="commentsQuestion${objId}"><span class="glyphicon glyphicon-remove"></span></g:remoteLink>
            </g:if>
            <g:else>
                <g:remoteLink controller="comment" action="deleteAnswerComment" id="${comment?.id}" params="[objId: objId]" update="commentsAnswer${objId}"><span class="glyphicon glyphicon-remove"></span></g:remoteLink>
            </g:else>
            </div>
        </div>
    </g:if>
    <g:fieldValue bean="${comment}" field="content"/>
    <div class="metadata">
    <g:fieldValue bean="${comment?.author}" field="username"/>
    <g:formatDate format="dd/MM/yyyy HH:mm" date="${comment?.date}"/>
    </div>
</li>