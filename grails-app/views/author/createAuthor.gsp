<%--
  Created by IntelliJ IDEA.
  User: rovalette
  Date: 15/01/2014
  Time: 16:02
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Steak Ovaire Flow</title>
    <meta name="layout" content="top">
</head>

<body>
<h1 class="pagetitle">Register</h1>


<g:form name="createAuthor" controller="Author" class="form-horizontal" action="createAuthor" method="post">
    <g:if test="${flash.message}">
        <div class="message alert alert-danger alert-dismissable" role="status">
            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
            ${flash.message}
        </div>
    </g:if>
    <div class="content">
        <div class="centerform">
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

            <div class="input-group">
                <span class="input-group-addon formlabel">Pseudo</span>
                <div class="form-control">
                    <g:field type="text" name="username" required="" value="${author?.username}" placeholder="Pseudo"/>
                </div>
            </div>

            <div class="input-group">
                <span class="input-group-addon formlabel">Mot de passe</span>
                <div class="form-control">
                    <g:field type="password" name="password" required="" value="${author?.password}" placeholder="Password"/>
                </div>
            </div>

            <div class="btn-group">
                    <g:actionSubmit value="S'enregistrer" class="btn btn-primary" action="createAuthor"/>
                    <g:link class="btn btn-default" role="button" controller="author" action="displayIndex">Annuler</g:link>
            </div>
        </div>
    </div>
</g:form>
</body>
</html>