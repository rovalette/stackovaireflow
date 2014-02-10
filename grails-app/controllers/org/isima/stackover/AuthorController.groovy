package org.isima.stackover

import org.bouncycastle.jce.provider.JCEKeyGenerator
import org.codehaus.groovy.grails.plugins.codecs.SHA256Codec


class AuthorController {

    def authorService

    def index()
    {
        render(view: 'login')
    }

    def displayCreateAuthor()
    {
        render(view:'createAuthor')
    }

    def displayEditAuthorInfo()
    {
        Long uid = session["UserId"]

        if(!session["UserId"])
        {
            render view:'/error'
        }

        Author author = authorService.getAuthorById(uid)

        render view: 'editAuthorInfo', model: [author: author]
    }

    def consult(){
        if (!session["UserId"])
        {
            redirect(action: "index")
            return
        }

        Author author = authorService.getAuthorById(session["UserId"])
        Float questionsAverageNote, answersAverageNote, voteAverage

        questionsAverageNote = authorService.getAverageQuestionNote(author)
        answersAverageNote = authorService.getAverageAnswerNote(author)
        voteAverage = authorService.getVoteAverage(author)

        if(!author)
        {
            render view: "login"
        }

        [author: author, questionsAverageNote:questionsAverageNote, answersAverageNote:answersAverageNote, voteAverage:voteAverage ]
    }

    def createAuthor()
    {
        Author author = new Author(firstname: params.firstname, lastname: params.lastname, email: params.email, username: params.username, password: params.password)

        if (authorService.createAuthor(author))
        {
            session["UserId"] = author.id
            redirect controller: "question", action: 'list'
        }
        else
        {
            flash.message = message(code: 'author.useralreadyexists', default: 'User already exists !')
            render(view: 'createAuthor', model: [author: author])
        }
    }

    def displayChangePassword()
    {
        if(!session["UserId"])
        {
            render view: 'login'
        }
        render view: 'changePassword'
    }

    def changePassword()
    {
        String oldPassword = params.oldPassword
        String newPassword = params.newPassword

        if (!authorService.changeAuthorPassword(newPassword, oldPassword, session["UserId"]))
        {
            flash.message = message(code: 'author.wrongpassword', default: "Bad password")
            render view: "displayChangePassword"
        }

        redirect action: "consult"
    }

    def editAuthorInfo()
    {
        Long uid = session["UserId"]

        if(!uid)
            render(view: 'login')

        Author newAuthor = new Author()
        newAuthor.properties = params

        if (!authorService.editAuthorInfo(newAuthor, uid))
            render(view: 'editAuthorInfo', model: [author: newAuthor])

        redirect controller:'question', action:'list'
    }

    def logout()
    {
        session.invalidate()
        redirect controller: 'question', action: 'list'
    }

    def signIn()
    {
        def String username = params.username
        def String password = params.password
        Author author;

        if (username == "" || password == "" || (author = authorService.signIn(username, password)) == null)
        {
            flash.message = message(code: 'author.invalideLoginOrPassword', default: 'Failed to log in')
            render(view:'login', model: [username: username, password: password])
        }
        else
        {
            session["UserId"] = author.id
            redirect controller:'question', action:'list'
        }
    }
}
