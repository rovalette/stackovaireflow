<%--
  Created by IntelliJ IDEA.
  User: rovalette
  Date: 15/01/2014
  Time: 16:02
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="top">
</head>

<body>
<h1 class="pagetitle"><g:message code="author.create" default="Create author"/></h1>

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
                <label for="firstname"><g:message code="author.firstname" default="First name"/></label>
                <g:field type="text" class="form-control" name="firstname" required="" value="${author?.firstname}" placeholder="${message (code:'author.firstname', default:'First name')}"/>
            </div>

            <div class="form-group">
                <label for="lastname"><g:message code="author.lastname" default="Last name"/></label>
                <g:field type="text" class="form-control" name="lastname" required="" value="${author?.lastname}" placeholder="${message (code:'author.lastname', default:'Last name')}"/>
            </div>

            <div class="form-group">
                <label for="email"><g:message code="author.email" default="Email"/></label>
                <g:field type="text" class="form-control" name="email" required="" value="${author?.email}" placeholder="${message (code:'author.email', default:'Email')}"/>
            </div>

            <div class="form-group">
                <label for="username"><g:message code="author.username" default="Username"/></label>
                <g:field type="text" class="form-control" name="username" required="" value="${author?.username}" placeholder="${message (code:'author.username', default:'Username')}"/>
            </div>

            <div class="form-group">
                <label for="password"><g:message code="author.password" default="Password"/></label>
                <g:field type="password" class="form-control" name="password" required="" value="${author?.password}" placeholder="${message (code:'author.password', default:'Password')}"/>
            </div>

            <div class="form-group">
                <label for="confirmPassword"><g:message code="author.confirmpassword" default="Confirm Password"/></label>
                <g:field type="password" class="form-control" name="confirmPassword" required="" placeholder="${message (code:'author.password', default:'Password')}"/>
            </div>

            <div class="btn-group">
                    <g:actionSubmit value="${message (code:'author.signup', default:'Sign up')}" class="btn btn-primary" action="createAuthor"/>
                    <g:link class="btn btn-default" role="button" controller="author" action="displayIndex"><g:message code="default.cancel" default="Cancel"/></g:link>
            </div>
        </div>
    </div>
</g:form>
</body>
</html>