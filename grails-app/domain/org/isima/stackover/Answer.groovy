package org.isima.stackover


class Answer {
	
	String content
	Date date
    int score = 0
	
	static belongsTo = [question:Question, author:Author]
	static hasMany = [comments:CommentAnswer, votes:AnswerVote]

    static constraints = {
		author(blank:false)
		question(blank:false)
		content(blank:false)
    }
}
