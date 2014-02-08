package org.isima.stackover

class QuestionVote extends Vote {

    static belongsTo = [question:Question]

    static constraints = {
        question(blank:false)
    }
}
