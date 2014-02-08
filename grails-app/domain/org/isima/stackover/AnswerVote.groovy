package org.isima.stackover

class AnswerVote {

    static belongsTo = [answer:Answer]

    static constraints = {
        answer(blank:false)
    }
}
