<li class="comment">
    <g:if test="${comment?.author?.id == session["UserId"] && objId}">
        <div class="icon left">
            <g:remoteLink controller="comment" action="delete" id="${comment?.id}" params="[objId: objId]" update="comments${objId}"><img src="${resource(dir: "/images", file: 'delete.png')}"/></g:remoteLink>
        </div>
    </g:if>
    <g:fieldValue bean="${comment}" field="content"/>
    <div class="metadata">
    <g:fieldValue bean="${comment?.author}" field="username"/>
    <g:formatDate format="dd/MM/yyyy HH:mm" date="${comment?.date}"/>
    </div>
</li>