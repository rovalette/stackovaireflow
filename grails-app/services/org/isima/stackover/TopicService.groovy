package org.isima.stackover

class TopicService {

    def serviceMethod() {

    }

    def Question getQuestion(Long id)
    {
        return Question.findById(id)
    }

    def Boolean addAnswer(Question q, Answer a)
    {
        q.addToAnwsers(a)
    }

    def void addQuestion(Question q)
    {
        q.save()
    }
}
