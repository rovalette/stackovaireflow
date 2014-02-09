<%--
  Created by IntelliJ IDEA.
  User: Samuel Morel
  Date: 06/02/14
  Time: 13:51
--%>


<li id="answer${a.id}" class="answer">
    <div id="content${a.id}">
        <div class="actions">
            <g:if test="${session["UserId"] && session["UserId"] != a.author.id}">
                <g:remoteLink controller="Vote" action="addAnswerVote" id="${a.id}" params="[isPositive:true]" onFailure="alert('already voted!')" update="score${a.id}"> <span class="glyphicon glyphicon-thumbs-up"></span></g:remoteLink>
                <div id="score${a.id}" class="score">${a.score}</div>
                <g:remoteLink controller="Vote" action="addAnswerVote" id="${a.id}" params="[isPositive:false]" onFailure="alert('already voted!')" update="score${a.id}"><span class="glyphicon glyphicon-thumbs-down"></span></g:remoteLink>
            </g:if>
            <g:else>
                <div id="score" class="score">score : ${score}</div>
                <div class="icon left">
                    <g:remoteLink controller="answer" action="delete" id="${a.id}" update="answers"><span class="glyphicon glyphicon-trash"></span></g:remoteLink>
                    <p></p>
                    <g:remoteLink controller="answer" action="startEdit" id="${a?.id}" update="content${a?.id}" class="left"><span class="glyphicon glyphicon-pencil"></span></g:remoteLink>
                </div>
            </g:else>
        </div>
        <p><g:fieldValue bean="${a}" field="content"/></p>
        <p><span class="metadata">
            <g:message code="answer.by" default="by"/>
            <g:fieldValue bean="${a?.author}" field="username"/>
            <g:formatDate format="dd/MM/yyyy HH:mm" date="${a.date}"/>
        </span></p>
    </div>
    <span id="comment-label" class="property-label"><g:message code="answers.comments.label" default="Comments" /></span>
    <ul id="commentsAnswer${a?.id}" class="comments">
        <g:render template="/comment/commentTemplate" collection="${a?.comments?.sort{it.date}}" var="comment" model="[objId: a.id]"/>
    </ul>
    <g:if test="${session["UserId"]}">
        <a onclick="$('#addComment${a?.id}').show()"><g:message code="comments.add" default="Add comment"/></a>
        <g:formRemote style="display:none" name="addComment${a?.id}" url="[controller :'Comment', action:'saveAnswerComment']" update="commentsAnswer${a.id}" onComplete="jQuery('#addComment${a.id}').val='';jQuery('#addComment${a.id}').hide()">
            <input type="hidden" id="objId" name="objId" value="${a?.id}" />
            <g:textArea id="newComment${a?.id}" name="content" required="" placeholder="Your answer"/>
            <input type="submit" class="btn btn-primary btn-xs" value="${message(code:"comment.create", default:"Leave this comment")}" />
            <g:remoteLink controller="comment" class="btn btn-default btn-xs" action="saveAnswerComment" id="${a.id}" params="[cancel:true, objId: a.id]" update="commentsAnswer${a.id}" onComplete="jQuery('#addComment${a.id}').val='';jQuery('#addComment${a.id}').hide()"><g:message code="default.cancel" default="Cancel"/></g:remoteLink>
        </g:formRemote>

    </g:if>
</li>