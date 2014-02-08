package org.isima.stackover

import org.codehaus.groovy.grails.web.servlet.mvc.GrailsParameterMap

class CommentController {

    def commentService

    def save() {
        Object commentInstance;
        Object isQuestion = params.get("isQuestion")
        if(!isQuestion)
        {
            commentInstance = new CommentAnswer()
        }
        else
        {
            commentInstance = new CommentQuestion()
        }

        GrailsParameterMap parameters = params
        commentInstance.content = parameters.content
        Long objId = Long.parseLong(parameters.get("objId"))


        if (!commentService.save(commentInstance, objId, session["UserId"]))
        {
            flash.message = message(code: 'comment.unabletosave', default: "unable to save comment")
            redirect controller: "question", action: 'show', id: aid
            return
        }

        Set<Comment> comments;

        if (params.isQuestion == false)
        {
            comments = Answer.get(objId).comments
        }
        else
        {
            comments = Question.get(objId).comments
        }

        render template: "/comment/commentTemplate", collection: comments.sort{it.date}, var: "comment", model: [answerId: objId]
    }

    def delete(Long id) {
        GrailsParameterMap parameters = params;
        Comment comment = commentService.get(id)
        Object objectInstance
        if (comment.instanceOf(CommentAnswer))
        {
            objectInstance = Answer.get(Long.parseLong(params.get("objId")))
        }
        else
        {
            objectInstance = Question.get(Long.parse(params.get("objId")))
        }

        objectInstance.comments.remove(comment)

        Set<Comment> comments = objectInstance.comments

        if (!commentService.delete(id))
        {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'answer.label', default: 'Answer'), id])
            redirect(action: "list")
            return
        }

        render template:"/comment/commentTemplate", collection: comments.sort{it.date}, var: "comment", model: [answerId: answerId]
    }
}
