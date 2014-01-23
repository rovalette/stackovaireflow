package org.isima.stackover


class Answer {
	
	String content
	Date date
	
	static belongsTo = [question:Question, author:Author]
	static hasMany = [comments:Comment]
	
    static constraints = {
		author(blank:false)
		question(blank:false)
		content(blank:false)
    }
}
