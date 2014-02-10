<%--
  Created by IntelliJ IDEA.
  User: Samuel Morel
  Date: 23/01/14
  Time: 08:16
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="top">
</head>

<body>
    <div class="content scaffold-list" role="main">
        <ul class="nav nav-tabs">
            <li class="active"><a href="#userStatsTab" data-toggle="tab"><g:message code="author.userstats" default="User Statistics"/></a></li>
            <li><a href="#questionsTab" data-toggle="tab"><g:message code="author.questions" default="Your Questions"/></a></li>
            <li><a href="#answersTab" data-toggle="tab"><g:message code="author.answers" default="Your Answers"/></a></li>
            <li><a href="#commentsTab" data-toggle="tab"><g:message code="author.comments" default="Your comments"/></a></li>
            <li><g:link controller="author" action="displayEditAuthorInfo"><g:message code="author.editprofile"/></g:link></li>
        </ul>

        <div class="tab-content">
            <div class="tab-pane active" id="userStatsTab">
               <p><g:message code="author.nbquestion" default="Number of questions"/> : ${author.questions.size()}</p>
                <p><g:message code="author.questionaveragenote" default="Question note average"/> : <g:formatNumber number="${questionsAverageNote}" type="number" format="###.##"/></p>
                <p></p>
                <p><g:message code="author.nbanswers" default="Number of answers"/> : ${author.answers.size()}</p>
                <p><g:message code="author.answeraveragenote" default="Question note average"/> : <g:formatNumber number="${answersAverageNote}" type="number" format="###.##"/></p>
                <p></p>
                <p><g:message code="author.nbcomment" default="Number of Comments"/> : ${author.answerComments.size() + author.questionComments.size()}</p>
                <p></p>
                <p><g:message code="author.nbvotes" default="Number of votes"/> : ${author.questionVotes.size() + author.answerVotes.size()}</p>
                <p><g:message code="author.voteaverage" default="The average mark"/> : <g:formatNumber number="${voteAverage}" type="number" format="###.##"/></p>
            </div>

            <div class="tab-pane" id="questionsTab">
                <g:if test="${author?.questions?.empty}">
                    <span class="label label-warning"><g:message code="question.noquestionyet" default="No question yet!"/></span>
                </g:if>
                <g:else>
                    <g:render template="/question/listQuestions" model="[questionInstanceList: author.questions, questionInstanceTotal: author.questions.size()]"/>
                </g:else>
            </div>

            <div class="tab-pane" id="commentsTab">
                <g:if test="${author?.answerComments?.empty && author?.questionComments?.empty}">
                    <span class="label label-warning"><g:message code="question.nocommentyet" default="No comment yet!"/></span>
                </g:if>
                <g:else>
                    <table class="table">
                        <thead>
                            <tr>
                                <g:sortableColumn property="content" title="${message(code: 'comment.content.label', default: 'Content')}" />
                                <g:sortableColumn property="date" title="${message(code: 'comment.date.label', default: 'Date')}" />
                            </tr>
                        </thead>
                        <tbody>
                            <g:each in="${author?.answerComments}" status="i" var="comment">
                                <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                                    <td>${fieldValue(bean: comment, field: "content")}</td>
                                    <td><g:formatDate format="dd/MM/yyyy HH:mm" date="${comment.date}"/></td>
                                    <td><g:link controller="question" action="show" id="${comment.answer.question.id}"><span class="btn btn-link"><g:message code="answer.gotoquestion" default="Go to it"/></span></g:link></td>
                                </tr>
                            </g:each>
                            <g:each in="${author?.questionComments}" status="i" var="comment">
                                <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                                    <td>${fieldValue(bean: comment, field: "content")}</td>
                                    <td><g:formatDate format="dd/MM/yyyy HH:mm" date="${comment.date}"/></td>
                                    <td><g:link controller="question" action="show" id="${comment.question.id}"><span class="btn btn-link"><g:message code="answer.gotoquestion" default="Go to it"/></span></g:link></td>
                                </tr>
                            </g:each>
                        </tbody>
                    </table>
                </g:else>
            </div>

            <div class="tab-pane" id="answersTab">
                <g:if test="${author?.answers?.empty}">
                    <span class="label label-warning"><g:message code="answers.noanswersyet" default="No answer yet!"/></span>
                </g:if>
                <g:else>
                    <table class="table">
                        <thead>
                        <tr>
                            <g:sortableColumn property="content" title="${message(code: 'answer.content.label', default: 'Content')}" />
                            <g:sortableColumn property="date" title="${message(code: 'answer.date.label', default: 'Date')}" />
                        </tr>
                        </thead>
                        <tbody>
                        <g:each in="${author?.answers}" status="i" var="answer">
                            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                                <td>${fieldValue(bean: answer, field: "content")}</td>
                                <td><g:formatDate format="dd/MM/yyyy HH:mm" date="${answer.date}"/></td>
                                <td><g:link controller="question" action="show" id="${answer.question.id}"><span class="btn btn-link"><g:message code="answer.gotoquestion" default="Go to it"/></span></g:link></td>
                            </tr>
                        </g:each>
                        </tbody>
                    </table>
                </g:else>
            </div>
        </div>
    </div>
</body>
</html>