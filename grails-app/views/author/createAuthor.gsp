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

<script type="application/javascript">
    function validatePassword()
    {
        if($('#password').val()!=$('#confirmPassword').val()){
            alert('Password not matches');
            return false;
        }
        return true;
    }
</script>


<g:form name="createAuthor" role="form" onsubmit="return validatePassword()" controller="Author" class="form-horizontal" action="createAuthor" method="post">
    <g:if test="${flash.message}">
        <div class="message alert alert-danger alert-dismissable" role="status">
            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
            ${flash.message}
        </div>
    </g:if>
    <div class="content">
        <div class="centerform">
    <div class="form-group">
        <label for="firstname">Prénom</label>
        <g:field type="text" class="form-control" name="firstname" required="" value="${author?.firstname}" placeholder="Prénom"/>
    </div>

    <div class="form-group">
        <label for="lastname">Nom</label>
        <g:field type="text" class="form-control" name="lastname" required="" value="${author?.lastname}" placeholder="Nom"/>
    </div>

    <div class="form-group">
        <label for="email">Email</label>
        <g:field type="text" class="form-control" name="email" required="" value="${author?.email}" placeholder="Email"/>
    </div>

    <div class="form-group">
        <label for="username">Pseudo</label>
        <g:field type="text" class="form-control" name="username" required="" value="${author?.username}" placeholder="Pseudo"/>
    </div>

    <div class="form-group">
        <label for="password">Mot de passe</label>
        <g:field type="password" class="form-control" name="password" required="" value="${author?.password}" placeholder="Password"/>
    </div>

    <div class="form-group">
        <label for="confirmPassword">Confirmer mot de passe</label>
        <g:field type="password" class="form-control" name="confirmPassword" required="" placeholder="Password"/>
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