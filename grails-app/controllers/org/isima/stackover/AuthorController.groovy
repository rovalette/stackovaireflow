package org.isima.stackover


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
        Author author = authorService.getAuthorById(session["UserId"])

        if(!author)
        {
            render view: "login"
        }

        [author: author]
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
