package org.isima.stackover

class TopicController {

    def topicService;

    def index() {
        redirect action: 'newTopic'
    }

    def consult()
    {
        /*if (!params?.id.isLong)
        {
            render(view: '../main')
        }*/

        Question q = topicService.getQuestion(Long.parseLong(params.id))

        render view: '/consult', model: [question: q]
    }

    def addAnswer()
    {
        Answer a = params.answer
        Question q = params.question

        topicService.addAnswer(q, a)

        redirect action: "consult", controller: 'TopicController', id: q.id
    }

    def newTopic()
    {
        render view: 'newTopic'
    }

    def saveNewTopic()
    {
        Question q = new Question()
        q.properties = params

        q.save()

        redirect action: 'consult', id: params.id
    }
}
