package org.isima.stackover


class AuthorController {

    def authorService

    def index()
    {
        render(view: 'login')
    }

    def displayIndex()
    {
        render(view: '/index', model: [username: params.username])
    }

    def displayCreateAuthor()
    {
        render(view:'createAuthor')
    }

    def displayEditAuthorInfo()
    {
        String username = params.username
        Author author = authorService.getAuthorByUsername(username)

        render(view: 'editAuthorInfo', model: [author: author])
    }

    def createAuthor()
    {
        Author author = new Author(firstname: params.firstname, lastname: params.lastname, email: params.email, username: params.username, password: params.password)

        if (authorService.createAuthor(author))
            render(view: '/index', model: [username: author.username])
        else
            render(view: 'createAuthor', model: [author: author])
    }

    def editAuthorInfo()
    {
        Author author = new Author(firstname: params.firstname, lastname: params.lastname, email: params.email, username: params.username)

        if (authorService.editAuthorInfo(author))
        {
            render(view: 'editAuthorInfo', model: [author: author])
        }
        render(view:'/index', model:[username: author.username])
    }

    def signIn()
    {
        def String username = params.username
        def String password = params.password

        Author author = authorService.signIn(username, password)

        if (author == null)
        {
            render(view:'login', model: [username: username, password: password])
        }
        render(view:'/index', model:[username: author.username])
    }
}
