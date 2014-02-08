package org.isima.stackover

class QuestionController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def questionService

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [questionInstanceList: Question.list(params), questionInstanceTotal: Question.count()]
    }

    def create() {
        if (!session["UserId"])
            redirect controller: 'author', action: 'index'

        [questionInstance: new Question(params)]
    }

    def save() {
        def questionInstance = new Question()
        questionInstance.properties = params

        if (!session["UserId"])
            redirect controller: 'author', action: 'index'

        questionInstance.author = Author.findById(session["UserId"])

        if (!questionService.save(questionInstance, params.tagList))
        {
            render(view: "create", model: [questionInstance: questionInstance, tagList: params.tagList])
            return
        }

        flash.message = message(code: 'question.successfullyadded', default: 'Question successfully added')
        redirect(action: "show", id: questionInstance.id)
    }

    def startEdit()
    {
        Question questionInstance = Question.get(params.id)
        String tagList = ""
        for(Tag t : questionInstance.tags)
            tagList += t.name + " "
        render template: "/question/form", bean: questionInstance, var: "questionInstance", model: [edit:true, tagList: tagList]
    }

    def endEdit()
    {
        Question questionInstance = Question.get(params.id)
        questionInstance.properties = params


        questionInstance = questionService.update(questionInstance.id, questionInstance, params.tagList)

        if (!questionInstance)
            redirect action: "startEdit", id: questionInstance.id

        render template:"/question/questionTemplate", bean: questionInstance, var: "questionInstance", model: [edit:true]
    }

    def show(Long id) {
        def questionInstance = questionService.get(id)
        if (!questionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'question.label', default: 'Question'), id])
            redirect(action: "list")
            return
        }

        [questionInstance: questionInstance]
    }

    def delete(Long id) {
        if (!questionService.delete(id))
        {
            flash.message = message(code: 'question.unabletodelete', default: "Unable to delete ", args: [message(code: 'question.label', default: 'Question'), id])
            redirect(action: "list")
        }
        render view:"list"
    }
}
