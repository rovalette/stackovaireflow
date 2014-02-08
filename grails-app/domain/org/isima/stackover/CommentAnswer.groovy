package org.isima.stackover

class CommentAnswer{

    String content
    Date date

    static belongsTo = [answer: Answer, author:Author]
    static constraints = {
        content(blank:false)
        date(blank:false)
    }
}
