package org.isima.stackover


class Question {	
	
	String title
	String content
	Date date
	
	static hasMany = [answers:Answer, comments:Comment, tags:Tag]
	static belongsTo = Tag
    
	static constraints = {
		title(blank:false)
		content(blank:false)
    }
}
