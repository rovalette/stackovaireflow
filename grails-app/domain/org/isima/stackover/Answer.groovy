package org.isima.stackover


class Answer extends Votable {
	
	String content
	Date date
	
	static belongsTo = [question:Question, author:Author]
	static hasMany = [comments:CommentAnswer]
	
    static constraints = {
		author(blank:false)
		question(blank:false)
		content(blank:false)
    }
}
