package org.isima.stackover


import org.codehaus.groovy.grails.scaffolding.view.ScaffoldedGroovyPageView;

class Author {
		
	String firstname
	String lastname
	String email
	String username
    String password
	
	static hasMany = [questions:Question, answers:Answer, comments:Comment]

    static constraints = {
		username(blank:false)
    }
}
