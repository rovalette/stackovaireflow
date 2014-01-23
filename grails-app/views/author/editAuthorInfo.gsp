<%--
  Created by IntelliJ IDEA.
  User: Samuel Morel
  Date: 23/01/14
  Time: 08:16
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Editer vos informations</title>
    <!-- Bootstrap -->
    <link href="${resource(dir:'css/bootstrap', file:'bootstrap.min.css')}" rel="stylesheet" media="screen">
    <link href="${resource(dir:'js/bootstrap', file:'bootstrap.js')}" type="application/javascript"/>
</head>

<body>
<h1>Editer vos informations</h1>
<g:form name="editAuthor" controller="Author" class="form-horizontal" action="editAuthorInfo" method="post">
    <div class="control-group">
        <label class="control-label" for="username">Pseudo</label>
        <div class="controls">
            <g:field type="text"  name="username" value="${author?.username}"/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label" for="firstname">Prénom</label>
        <div class="controls">
            <g:field type="text" name="firstname" value="${author?.firstname}" placeholder="Prénom"/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label" for="lastname">Nom</label>
        <div class="controls">
            <g:field type="text" name="lastname" value="${author?.lastname}" placeholder="Nom"/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label" for="email">Email</label>
        <div class="controls">
            <g:field type="text" name="email" value="${author?.email}" placeholder="Email"/>
        </div>
    </div>
    <div class="control-group">
        <div class="controls">
            <g:actionSubmit value="Editer" class="btn btn-primary" action="editAuthorInfo"/>
            <g:link class="btn btn-default" role="button" controller="author" action="displayIndex" params="[username: author?.username]">Annuler</g:link>
        </div>
    </div>
</g:form>
</body>
</html>