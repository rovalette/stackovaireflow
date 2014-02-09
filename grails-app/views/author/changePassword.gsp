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
<h1><g:message code="author.changepassword" default="Change password"/></h1>
<g:form name="editAuthor" role="form" controller="Author" onsubmit="return validatePassword()" class="form-horizontal" action="changePassword" method="post">

    <div class="content">
        <div class="centerform">

            <div class="form-group">
                <label for="oldPassword"><g:message code="author.oldpassword" default="Old password"/></label>
                <g:field type="password" class="form-control" name="oldPassword" required="" value="${oldPassword}" placeholder="${message (code:'author.oldpassword', default:'Old password')}"/>
            </div>

            <div class="form-group">
                <label for="newPassword"><g:message code="author.newpassword" default="New password"/></label>
                <g:field type="password" class="form-control" name="newPassword" id="newPassword" required="" value="${newPassword}" placeholder="${message (code:'author.password', default:'Password')}"/>
            </div>

            <div class="form-group">
                <label for="newCpassword"><g:message code="author.confirmpassword" default="Confirm password"/></label>
                <g:field type="password" class="form-control" name="newCpassword" id="newCpassword" required="" placeholder="${message (code:'author.password', default:'Password')}"/>
            </div>

            <div class="btn-group">
                <g:link class="btn btn-default" role="button" controller="author" action="displayIndex" params="[username: author?.username]"><g:message code="default.cancel" default="Cancel"/></g:link>
                <g:actionSubmit value="${message (code:'author.edit', default:'Edit')}" class="btn btn-primary" onsubmit="return validatePassword()" action="changePassword"/>
            </div>

        </div>
    </div>
</g:form>
</body>
</html>