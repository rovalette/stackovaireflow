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
<h1><g:message code="author.editprofile" default="Edit your profile"/></h1>
<g:form name="editAuthor" role="form" controller="Author" class="form-horizontal" action="editAuthorInfo" method="post">
    
    <div class="content">
        <g:link class="btn btn-default right" role="button" contrller="author" action="displayChangePassword">Change Password</g:link>
        <div class="centerform">
            <div class="form-group">
                <label for="username"><g:message code="author.username" default="Username"/></label>
                <g:field type="text"  name="username" class="form-control" required="" value="${author?.username}" placeholder="${message (code:'author.username', default:'Username')}"/>
            </div>

            <div class="form-group">
                <label for="firstname"><g:message code="author.firstname" default="First name"/></label>
                <g:field type="text" name="firstname" class="form-control" required="" value="${author?.firstname}" placeholder="${message (code:'author.firstname', default:'First name')}"/>
            </div>

            <div class="form-group">
                <label for="lastname"><g:message code="author.lastname" default="Last name"/></label>
                <g:field type="text" class="form-control" name="lastname" required="" value="${author?.lastname}" placeholder="${message (code:'author.lastname', default:'Last name')}"/>
            </div>

            <div class="form-group">
                <label for="email"><g:message code="author.email" default="Email"/></label>
                <g:field type="text" name="email" class="form-control" required="" value="${author?.email}" placeholder="${message (code:'author.email', default:'Email')}"/>
            </div>

            <div class="btn-group">
                <g:link class="btn btn-default" role="button" controller="author" action="displayIndex" params="[username: author?.username]"><g:message code="default.cancel" default="Cancel"/></g:link>
                <g:actionSubmit value="${message (code:'author.edit', default:'Editer')}" class="btn btn-primary" action="editAuthorInfo"/>
            </div>

        </div>
    </div>
</g:form>
</body>
</html>