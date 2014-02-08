package org.isima.stackover


class Question extends Votable {
	
	String title
	String content
	Date date
    Author author

	
	static hasMany = [answers:Answer, comments:CommentQuestion, tags:Tag]
	static belongsTo = [Author]

	static constraints = {
		title(blank:false)
		content(blank:false)
    }
}
