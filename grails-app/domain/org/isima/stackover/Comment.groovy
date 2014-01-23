package org.isima.stackover


class Comment {
	
	String content
	Date date
	
	static belongsTo = [author:Author]

    static constraints = {
		author(blank:false)
		content(blank:false)
    }
}
