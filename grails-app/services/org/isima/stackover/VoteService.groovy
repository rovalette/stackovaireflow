package org.isima.stackover

class VoteService {

    def saveQuestionVote(QuestionVote v) {
        Question q = v.question

        for(QuestionVote vote : q.votes)
            if (vote.author.equals(v.author))
                return false

        v.save(flush:true)
    }

    def saveAnswerVote(AnswerVote v) {
        Answer a = v.answer

        for(AnswerVote vote : a.votes)
            if (vote.author.equals(v.author))
                return false

        if (!v.save(flush: true))
            return false
        return true
    }
}
