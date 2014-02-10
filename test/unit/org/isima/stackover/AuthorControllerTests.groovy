package org.isima.stackover



import grails.test.mixin.*
import org.junit.*

/**
 * See the API for {@link grails.test.mixin.web.ControllerUnitTestMixin} for usage instructions
 */
@TestFor(AuthorController)
@Mock(Author)
class AuthorControllerTests {

    void testIndex() {
		controller.index()
        assert response.redirectedUrl == '/author/login'
    }

    void testDisplayCreateAuthor() {
        controller.displayCreateAuthor()
        assert response.redirectedUrl == '/author/createAuthor'
    }

    void testDisplayEditAuthorInfo() {
        controller.displayCreateAuthor()
        assert response.redirectedUrl == '/author/editAuthorInfo'
    }


}
