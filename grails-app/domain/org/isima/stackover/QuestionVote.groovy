package org.isima.stackover

class QuestionVote {

    Boolean isPositive
    Date date

    static belongsTo = [question:Question, author:Author]

    static constraints = {
        question(blank:false)
        author(blank:false)
    }
}
