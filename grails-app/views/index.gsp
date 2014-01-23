<%--
  Created by IntelliJ IDEA.
  User: Samuel Morel
  Date: 23/01/14
  Time: 15:35
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Bienvenu sur steack d'ovaire!</title>
    <link href="${resource(dir:'css/bootstrap', file:'bootstrap.min.css')}" rel="stylesheet" media="screen">
    <link href="${resource(dir:'js/bootstrap', file:'bootstrap.js')}" type="application/javascript"/>
</head>

<body>
    <h1>Bienvenu sur steak d'ovaire</h1>

    <g:if test="${username}">
        <g:link class="btn btn-primary" role="button" controller="Author" action="displayEditAuthorInfo" params="[username: username]">Editer vos informations</g:link>
    </g:if>
    <g:else>
        <g:link class="btn btn-default" role="button" controller="Author" action="index">Se connecter</g:link>
        <g:link class="btn btn-primary" role="button" controller="Author" action="displayCreateAuthor">S'enregistrer</g:link>
    </g:else>

</body>
</html>