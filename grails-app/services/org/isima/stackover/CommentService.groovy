package org.isima.stackover

import org.springframework.dao.DataIntegrityViolationException

class CommentService {

    def getCommentAnswer(Long id)
    {
        return CommentAnswer.get(id)
    }

    def getCommentQuestion(Long id)
    {
        return CommentQuestion.get(id)
    }

    def saveQuestionComment(CommentQuestion commentInstance, Long objId, Long authorId) {

        Question questionInstance = Question.get(objId)

        Author author = Author.get(authorId)

        commentInstance.date = new Date()
        commentInstance.author = author

        if(!commentInstance.save(flush: true))
            return null

        if (!questionInstance.comments)
            questionInstance.comments = new ArrayList<CommentQuestion>()

        questionInstance.comments.add(commentInstance)
        questionInstance.save(flush: true)

        if (!author.questionComments)
            author.questionComments = new ArrayList<CommentQuestion>()

        author.questionComments.add(commentInstance)
        author.save(flush: true)

        return commentInstance
    }

    def saveAnswerComment(CommentAnswer commentInstance, Long objId, Long authorId) {

        Answer answerInstance = Answer.get(objId)

        Author author = Author.get(authorId)

        commentInstance.date = new Date()
        commentInstance.author = author
        commentInstance.answer = answerInstance

        if(!commentInstance.save(flush: true))
            return null

        if (!answerInstance.comments)
            answerInstance.comments = new ArrayList<CommentAnswer>()

        answerInstance.comments.add(commentInstance)
        answerInstance.save(flush: true)

        if (!author.answerComments)
            author.answerComments = new ArrayList<CommentAnswer>()

        author.answerComments.add(commentInstance)
        author.save(flush: true)

        return commentInstance
    }

    def deleteQuestionComment(Long id)
    {
        CommentQuestion comment = CommentQuestion.get(id)
        if (!comment)
            return false

        try{
            comment.delete()
            return true
        }
        catch(DataIntegrityViolationException e){
            return false
        }
    }

    def deleteAnswerComment(Long id)
    {
        CommentAnswer comment = CommentAnswer.get(id)
        if (!comment)
            return false

        try{
            comment.delete()
            return true
        }
        catch(DataIntegrityViolationException e){
            return false
        }
    }

    def update(Long id, Comment newComment)
    {
        Comment commentInstance = Comment.get(id)

        if(!commentInstance)
            return null

        commentInstance.content = newComment.content

        if (!commentInstance.save())
            return null

        return commentInstance
    }
}
