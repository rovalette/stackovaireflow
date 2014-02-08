package org.isima.stackover

import org.codehaus.groovy.grails.web.servlet.mvc.GrailsParameterMap

class CommentController {

    def commentService

    def saveAnswerComment()
    {
        CommentAnswer commentInstance = new CommentAnswer(params)

        Long answerId = Long.parseLong(params.objId)

        if (!commentService.saveAnswerComment(commentInstance, answerId, session["UserId"]))
        {
            return
        }

        render template: "/comment/commentTemplate", collection: Answer.get(answerId).comments.sort{it.date}, var: "comment", model: [objId: answerId]
    }

    def saveQuestionComment() {
        CommentQuestion commentInstance = new CommentQuestion(params)

        Long questionId =(Long) params.get("objId")

        if (!commentService.saveQuestionComment(commentInstance, questionId, session["UserId"]))
        {
            return
        }

        render template: "/comment/commentTemplate", collection: Question.get(questionId).comments.sort{it.date}, var: "comment", model: [objId: questionId]
    }

    def deleteAnswerComment(Long id) {
        CommentAnswer comment = commentService.getCommentAnswer(id)

        Answer answer = Answer.get(params.objId)

        answer.comments.remove(comment)

        if (!commentService.deleteAnswerComment(id))
        {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'answer.label', default: 'Answer'), id])
            redirect(action: "list")
            return
        }

        render template:"/comment/commentTemplate", collection: answer.comments.sort{it.date}, var: "comment", model: [objId: answer.id]
    }

    def deleteQuestionComment(Long id) {
        CommentQuestion comment = commentService.getCommentQuestion(id)

        Question question = Question.get(params.objId)

        question.comments.remove(comment)

        if (!commentService.deleteQuestionComment(id))
        {
            return
        }

        render template:"/comment/commentTemplate", collection: question.comments.sort{it.date}, var: "comment", model: [objId: question.id]
    }
}
