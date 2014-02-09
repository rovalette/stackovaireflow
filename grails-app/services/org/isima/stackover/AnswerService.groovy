package org.isima.stackover

import org.springframework.dao.DataIntegrityViolationException

class AnswerService {

    def get(Long id)
    {
        return Answer.get(id)
    }

    def save(Answer answerInstance, Long qid) {
        answerInstance.date = new Date()
        answerInstance.question = Question.findById(qid)
        if (!answerInstance.save(flush: true)) {
            return null
        }
        return answerInstance
    }

    def update(Long id, Answer newAnswer)
    {
        def answerInstance = Answer.get(id)
        if (!answerInstance) {
            return null
        }

        answerInstance.content = newAnswer.content

        if (!answerInstance.save(flush: true)) {
            return null
        }

        return answerInstance
    }

    def delete(Long id)
    {
        def answerInstance = Answer.get(id)

        if (!answerInstance) {
            return false
        }

        try {
            for(CommentAnswer c : answerInstance.comments)
                c.delete()
            answerInstance.delete(flush: true)
            return true
        }
        catch (DataIntegrityViolationException e) {
            return false
        }
    }

    def updateScore(Answer a, AnswerVote v)
    {
        a.score += (v.isPositive?1:-1)
        a.save(flush: true)
        return
    }
}
