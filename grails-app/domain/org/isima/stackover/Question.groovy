package org.isima.stackover


class Question {	
	
	String title
	String content
	Date date
    Author author

	
	static hasMany = [answers:Answer, comments:Comment, tags:Tag]
	static belongsTo = [Author]

	static constraints = {
		title(blank:false)
		content(blank:false)
    }
}
