package org.isima.stackover

class Tag {
	
	String name

    static hasMany = [questions: Question]
    static belongsTo = Question
    static constraints = {
		name(blank:false)
    }
}
