package org.isima.stackover

class VoteService {

    def saveQuestionVote(QuestionVote v) {
        v.save(flush:true)
    }

    def saveAnswerVote(AnswerVote v) {
        v.save(flush: true)
    }
}
