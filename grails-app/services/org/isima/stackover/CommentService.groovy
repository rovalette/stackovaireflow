package org.isima.stackover

import org.springframework.dao.DataIntegrityViolationException

class CommentService {

    def get(Long id)
    {
        return Comment.get(id)
    }

    def save(Comment commentInstance, Long objId, Long authorId) {

        Object objectInstance
        if (commentInstance.instanceof(CommentAnswer.class))
            objectInstance = Answer.get(objId)
        else
            objectInstance = Question.get(objId)

        Author author = Author.get(authorId)

        commentInstance.date = new Date()
        commentInstance.author = author

        if(!commentInstance.save(flush: true))
            return null

        if (!objectInstance.comments)
            objectInstance.comments = new ArrayList<Comment>()

        objectInstance.comments.add(commentInstance)
        objectInstance.save(flush: true)

        if (!author.comments)
            author.comments = new ArrayList<Comment>()

        author.comments.add(commentInstance)
        author.save(flush: true)

        return commentInstance
    }

    def delete(Long id)
    {
        Comment comment = Comment.get(id)
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
