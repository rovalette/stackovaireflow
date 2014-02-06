package org.isima.stackover

class Author {
		
	String firstname
	String lastname
	String email
	String username
    String password
	
	static hasMany = [questions:Question, answers:Answer, comments:Comment, votes:Vote]

    static constraints = {
		username(blank:false)
        password(blank:false)
    }
}
