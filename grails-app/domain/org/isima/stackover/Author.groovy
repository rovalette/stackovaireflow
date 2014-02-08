package org.isima.stackover

class Author {
		
	String firstname
	String lastname
	String email
	String username
    String password
	
	static hasMany = [questions:Question, answers:Answer, answerComments:CommentAnswer, questionComments:CommentQuestion, questionVotes:QuestionVote, answerVotes:AnswerVote]
    static constraints = {
		username(blank:false)
        password(blank:false)
    }
}
