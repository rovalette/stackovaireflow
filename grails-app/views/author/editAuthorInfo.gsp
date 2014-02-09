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
<h1>Editer vos informations</h1>
<g:form name="editAuthor" role="form" controller="Author" class="form-horizontal" action="editAuthorInfo" method="post">
    
    <div class="content">
        <g:link class="btn btn-default right" role="button" contrller="author" action="displayChangePassword">Change Password</g:link>
        <div class="centerform">
            <div class="form-group">
                <label for="username">Pseudo</label>
                <g:field type="text"  name="username" class="form-control" required="" value="${author?.username}" placeholder="Pseudo"/>
            </div>

            <div class="form-group">
                <label for="firstname">Prénom</label>
                <g:field type="text" name="firstname" class="form-control" required="" value="${author?.firstname}" placeholder="Prénom"/>
            </div>

            <div class="form-group">
                <label for="lastname">Nom</label>
                <g:field type="text" class="form-control" name="lastname" required="" value="${author?.lastname}" placeholder="Nom"/>
            </div>

            <div class="form-group">
                <label for="email">Email</label>
                <g:field type="text" name="email" class="form-control" required="" value="${author?.email}" placeholder="Email"/>
            </div>

            <div class="btn-group">
                <g:link class="btn btn-default" role="button" controller="author" action="displayIndex" params="[username: author?.username]">Annuler</g:link>
                <g:actionSubmit value="Editer" class="btn btn-primary" action="editAuthorInfo"/>
            </div>

        </div>
    </div>
</g:form>
</body>
</html>