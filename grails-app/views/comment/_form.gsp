<g:if test="${isQuestion}">
    <g:formRemote name="editCommentQuestion" url="[controller :'Comment', action:'endEditQuestionComment']" update="comment${comment.id}">
        <g:hiddenField name="id" value="${comment.id}"/>
        <g:hiddenField name="objId" value="${objId}"/>
        <g:textArea name="content" value="${comment.content}"/>
        <input type="submit" class="btn btn-primary" value="${message(code:"answer.edit", default:"End edition")}" />
    </g:formRemote>
</g:if>
<g:else>
    <g:formRemote name="editComment" url="[controller :'Comment', action:'endEditAnswerComment']" update="comment${comment.id}">
        <g:hiddenField name="id" value="${comment.id}"/>
        <g:hiddenField name="objId" value="${objId}"/>
        <g:textArea name="content" value="${comment.content}"/>
        <input type="submit" class="btn btn-primary" value="${message(code:"answer.edit", default:"End edition")}" />
    </g:formRemote>
</g:else>