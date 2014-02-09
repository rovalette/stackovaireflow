<g:formRemote name="editAnswer" url="[controller :'Answer', action:'endEdit']" update="content${a.id}">
    <g:hiddenField name="id" value="${a.id}"/>
    <g:textArea name="content" value="${a.content}"/>
    <input type="submit" class="btn btn-primary" value="${message(code:"answer.edit", default:"End edition")}" />
</g:formRemote>