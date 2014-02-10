package org.isima.stackover



import grails.test.mixin.*
import org.junit.*

/**
 * See the API for {@link grails.test.mixin.web.ControllerUnitTestMixin} for usage instructions
 */
@TestFor(CommentController)
@Mock(CommentAnswer)
@Mock(CommentQuestion)
class CommentControllerTests {

    void testSaveAnswerComment() {
        controller.saveAnswerComment()


    }
}
