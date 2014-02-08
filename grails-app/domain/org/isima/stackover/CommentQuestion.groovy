package org.isima.stackover

class CommentQuestion{

    String content
    Date date

    static belongsTo = [question: Question, author:Author]
    static constraints = {
        content(blank:false)
        date(blank:false)
    }
}
