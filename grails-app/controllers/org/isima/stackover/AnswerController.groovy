package org.isima.stackover

import org.codehaus.groovy.grails.web.servlet.mvc.GrailsParameterMap

class AnswerController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def answerService

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [answerInstanceList: Answer.list(params), answerInstanceTotal: Answer.count()]
    }

    def create() {
        [answerInstance: new Answer(params)]
    }

    def save() {
        Answer answerInstance = new Answer(params)
        GrailsParameterMap parameters = params
        Long qid = Long.parseLong(parameters.get("qid"))
        answerInstance.author = Author.get(session["UserId"])

        if (!answerService.save(answerInstance, qid))
        {
            flash.message = message(code: 'answser.unabletosave', default: "unable to save answer")
            redirect action: 'list'
            return
        }

        render template: "/answer/answerTemplate", collection: answerInstance.question.answers.sort{it.date}, var: "a"
    }

    def show(Long id) {
        def answerInstance = Answer.get(id)
        if (!answerInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'answer.label', default: 'Answer'), id])
            redirect(action: "list")
            return
        }

        [answerInstance: answerInstance]
    }

    def edit(Long id) {
        def answerInstance = answerService.get(id)
        if (!answerInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'answer.newansweradded', default: 'New answer added!')])
            redirect(action: "list")
            return
        }

        [answerInstance: answerInstance]
    }

    def update(Long id) {
        Answer answerInstance = new Answer()
        answerInstance.properties = params

        if (!answerService.update(answerInstance)) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'answer.label', default: 'Answer'), id])
            redirect(action: "list")
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'answer.label', default: 'Answer'), answerInstance.id])
        redirect(action: "show", id: answerInstance.id)
    }

    def delete(Long id) {
        Question questionInstance  = answerService.get(id).question

        if (!answerService.delete(id))
        {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'answer.label', default: 'Answer'), id])
            redirect(action: "list")
            return
        }

        render template:"/answer/answerTemplate", collection: questionInstance.answers.sort{it.date}, var: "a"
    }
}
