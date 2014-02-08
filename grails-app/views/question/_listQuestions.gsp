<div class="panel panel-default">
    <table class="table">
    <thead>
    <tr>

        <g:sortableColumn property="title" title="${message(code: 'question.title.label', default: 'Title')}" />

        <g:sortableColumn property="content" title="${message(code: 'question.content.label', default: 'Content')}" />

        <g:sortableColumn property="date" title="${message(code: 'question.date.label', default: 'Date')}" />

    </tr>
    </thead>
    <tbody>
    <g:each in="${questionInstanceList}" status="i" var="questionInstance">
        <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

            <td><g:link controller="question" action="show" id="${questionInstance.id}">${fieldValue(bean: questionInstance, field: "title")}</g:link></td>

            <td>${fieldValue(bean: questionInstance, field: "content")}</td>

            <td><g:formatDate format="dd/MM/yyyy HH:mm" date="${questionInstance.date}" /></td>

        </tr>
    </g:each>
    </tbody>
</table>
</div>
<div class="pagination pagination-centered">
    <g:paginate total="${questionInstanceTotal}" />
</div>