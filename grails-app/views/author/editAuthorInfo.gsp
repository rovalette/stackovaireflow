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

    <meta name="layout" content="top">
</head>

<body>
<h1>Editer vos informations</h1>
<g:form name="editAuthor" controller="Author" class="form-horizontal" action="editAuthorInfo" method="post">
    
    <div class="content">
        <div class="centerform">
            <div class="input-group">
                <span class="input-group-addon formlabel">Pseudo</span>
                <div class="form-control">
                    <g:field type="text"  name="username" required="" value="${author?.username}" placeholder="Pseudo"/>
                </div>
            </div>

            <div class="input-group">
                <span class="input-group-addon formlabel">Prénom</span>
                <div class="form-control">
                    <g:field type="text" name="firstname" required="" value="${author?.firstname}" placeholder="Prénom"/>
                </div>
            </div>

            <div class="input-group">
                <span class="input-group-addon formlabel">Nom</span>
                <div class="form-control">
                    <g:field type="text" name="lastname" required="" value="${author?.lastname}" placeholder="Nom"/>
                </div>
            </div>

            <div class="input-group">
                <span class="input-group-addon formlabel">Email</span>
                <div class="form-control">
                    <g:field type="text" name="email" required="" value="${author?.email}" placeholder="Email"/>
                </div>
            </div>

            <div class="btn-group">
                    <g:actionSubmit value="Editer" class="btn btn-primary" action="editAuthorInfo"/>
                    <g:link class="btn btn-default" role="button" controller="author" action="displayIndex" params="[username: author?.username]">Annuler</g:link>
            </div>

        </div>
    </div>
</g:form>
</body>
</html>