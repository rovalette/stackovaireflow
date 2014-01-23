package org.isima.stackover

class AuthorService {

    def Boolean createAuthor(Author author)
    {
        if (userExists(author.username).equals(false))
        {
            author.save()
            return true
        }
        return false
    }

    def Boolean userExists(String username)
    {
        return !Author.findAllByUsername(username).empty
    }

    def Author editAuthorInfo(Author newAuthor)
    {
        Author oldAuthor = Author.findByUsername(newAuthor.username)
        oldAuthor.firstname = newAuthor.firstname
        oldAuthor.lastname  = newAuthor.lastname
        oldAuthor.email     = newAuthor.email
        oldAuthor.save()
    }

    def Author changeAuthorPassword(String newPassword, String username)
    {
        Author author = Author.findByUsername(username)
        author.password = newPassword
        author.save()
    }

    def Author getAuthorByUsername(String username)
    {
        return Author.findByUsername(username)
    }

    def Author signIn(String username, String password)
    {
        return Author.findByUsernameAndPassword(username, password)
    }
}
