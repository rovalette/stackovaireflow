<%--
  Created by IntelliJ IDEA.
  User: Samuel Morel
  Date: 03/02/14
  Time: 23:22
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>New Topic</title>
    <link href="${resource(dir:'css/bootstrap', file:'bootstrap.css')}" rel="stylesheet" type="text/css"/>
    <link href="${resource(dir:'js/bootstrap' , file:'bootstrap.js' )}" type="application/javascript"   />
</head>

<body>
<h1>New Question</h1>

<g:form name="newTopic" class="form-horizontal" controller="topic" action="saveNewTopic" method="post">
    <div class="control-group">
        <label class="control-label" for="title">Title</label>
        <div class="controls">
            <g:field type="text" name="title" value="${question?.title}" placeholder="title"/>
        </div>
    </div>
    <div class="control-group">
        <label class="control-label" for="content">Content</label>
        <div class="controls">
            <g:textArea type="text" name="content" value="${question?.content}" placeholder="Content..."/>
        </div>
    </div>
    <div class="control-group">
        <div class="controls">
            <g:actionSubmit value="Submit question" class="btn btn-primary"/>
        </div>
    </div>
</g:form>
</body>
</html>