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
    <script type="application/javascript">
        function validatePassword()
        {
            if($('#newPassword').val()!=$('#newCpassword').val()){
                alert('Password not matches');
                return false;
            }
            return true;
        }
    </script>
</head>

<body>
<h1>Changer de mot de passe</h1>
<g:form name="editAuthor" role="form" controller="Author" onsubmit="return validatePassword()" class="form-horizontal" action="changePassword" method="post">

    <div class="content">
        <div class="centerform">

            <div class="form-group">
                <label for="oldPassword">Ancien mot de passe</label>
                <g:field type="password" class="form-control" name="oldPassword" required="" value="${oldPassword}" placeholder="Password"/>
            </div>

            <div class="form-group">
                <label for="newPassword">Nouveai mot de passe</label>
                <g:field type="password" class="form-control" name="newPassword" id="newPassword" required="" value="${newPassword}" placeholder="Password"/>
            </div>

            <div class="form-group">
                <label for="newCpassword">Confirmer mot de passe</label>
                <g:field type="password" class="form-control" name="newCpassword" id="newCpassword" required="" placeholder="Password"/>
            </div>

            <div class="btn-group">
                <g:link class="btn btn-default" role="button" controller="author" action="displayIndex" params="[username: author?.username]">Annuler</g:link>
                <g:actionSubmit value="Editer" class="btn btn-primary" onsubmit="return validatePassword()" action="changePassword"/>
            </div>

        </div>
    </div>
</g:form>
</body>
</html>