package org.isima.stackover

class VoteController {

    def voteService
    def questionService
    def answerService

    def addQuestionVote()
    {
        Question q = Question.get(params.id)
        QuestionVote v = new QuestionVote(params)

        v.author = Author.get(session["UserId"])
        v.date = new Date()
        v.question = q

        if (!voteService.saveQuestionVote(v))
        {
            flash.message = message(code: "vote.alreadyVoted", default: "Already voted!")
            return
        }

        if (!q.votes)
        {
            q.votes = new ArrayList<QuestionVote>()
        }

        q.votes.add(v)
        q.save(flush:true)
        render questionService.getScore(q)
    }

    def addAnswerVote()
    {
        Answer a = Answer.get(params.id)
        AnswerVote v = new AnswerVote(params)

        v.author = Author.get(session["UserId"])
        v.date = new Date()
        v.answer = a

        if (!voteService.saveAnswerVote(v))
        {
            return
        }

        if (!a.votes)
        {
            a.votes = new ArrayList<AnswerVote>()
        }

        a.votes.add(v)
        answerService.updateScore(a, v)
        a.save(flush:true)
        render a.score
    }
}
