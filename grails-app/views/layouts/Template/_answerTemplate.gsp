<%--
  Created by IntelliJ IDEA.
  User: Samuel Morel
  Date: 06/02/14
  Time: 13:51
--%>

<li class="answer">
    <g:fieldValue bean="${a}" field="content"/>
    <span class="metadata">
        <g:fieldValue bean="${a.author}" field="username"/>
        <g:formatDate format="dd/MM/yyyy HH:ss" date="${a.date}"/>
    </span>
    <g:if test="${a?.comments}">
        <span id="comment-label" class="property-label"><g:message code="answers.comments.label" default="Comments" /></span>
        <ul class="comments">
            <g:each in="$a?.comments" var="c">
                <li>
                    <g:fieldValue bean="${c.author}" field="username"/>
                    <g:fieldValue bean="${c}" field="content"/>
                </li>
            </g:each>
        </ul>
    </g:if>
</li>