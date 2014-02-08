package org.isima.stackover

class AnswerVote {

    Boolean isPositive
    Date date

    static belongsTo = [answer:Answer, author:Author]

    static constraints = {
        answer(blank:false)
        author(blank:false)
    }
}
