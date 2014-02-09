package org.isima.stackover


class Question {
	
	String title
	String content
	Date date

	static hasMany = [answers:Answer, comments:CommentQuestion, tags:Tag, votes:QuestionVote]
    static belongsTo = [author:Author]

	static constraints = {
		title(blank:false)
		content(blank:false)
    }
}
