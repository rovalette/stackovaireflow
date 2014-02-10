package org.isima.stackover

import cr.co.arquetipos.password.PasswordTools

class AuthorService {

    def questionService

    def Boolean createAuthor(Author author)
    {
        if (userExists(author.username).equals(false))
        {
            author.password = PasswordTools.saltPasswordBase64(author.password)

            author.save(flush: true)
            return true
        }
        return false
    }

    def Boolean userExists(String username)
    {
        return !Author.findAllByUsername(username).empty
    }

    def Boolean editAuthorInfo(Author newAuthor, Long uid)
    {
        if (newAuthor.username != "" && newAuthor.firstname != "" && newAuthor.lastname != "" && newAuthor.email != "")
        {
            Author oldAuthor = Author.findById(uid)
            oldAuthor.username  = newAuthor.username
            oldAuthor.firstname = newAuthor.firstname
            oldAuthor.lastname  = newAuthor.lastname
            oldAuthor.email     = newAuthor.email
            oldAuthor.save(flush: true)
            return true;
        }
        return false;
    }

    def Author changeAuthorPassword(String newPassword, String oldPassword, Long uid)
    {
        Author author = Author.findById(uid)
        if (!PasswordTools.checkDigestBase64(oldPassword, author.password))
        {
            return null
        }
        newPassword = PasswordTools.saltPasswordBase64(newPassword)
        author.password = newPassword
        author.save(flush: true)

    }

    def Author getAuthorById(Long uid)
    {
        return Author.findById(uid)
    }

    def Author signIn(String username, String password)
    {
        Author user = Author.findByUsername(username)
        if (PasswordTools.checkDigestBase64(password, user.password))
            return user
        return null
    }

    def getAverageQuestionNote(Author author)
    {
        int score = 0
        int cpt = 0
        for(Question q : author.questions)
        {
            score += questionService.getScore(q)
            ++cpt
        }

        return (Float) (cpt>0?score/cpt:0)
    }

    def getAverageAnswerNote(Author author)
    {
        int score = 0
        int cpt = 0
        for(Answer a : author.answers)
        {
            score += (a.score)
            ++cpt
        }

        return (Float) (cpt>0?score/cpt:0)
    }

    def getVoteAverage(Author author)
    {
        int score = 0
        int cpt = 0

        for(QuestionVote v : author.questionVotes)
        {
            score += (v.isPositive?1:-1)
            ++cpt
        }

        for(AnswerVote v : author.answerVotes)
        {
            score += (v.isPositive?1:-1)
            ++cpt
        }


        return (Float) (cpt>0?score/cpt:0)
    }
}
