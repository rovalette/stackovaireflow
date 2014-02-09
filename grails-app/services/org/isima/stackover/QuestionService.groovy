package org.isima.stackover

import org.springframework.dao.DataIntegrityViolationException

class QuestionService {

    def assignTags(Question question, String tagList)
    {
        def Tag currentTag
        if (question.tags == null)
            question.tags = new ArrayList<Tag>()
        else
            question.tags.clear()

        for(String tag : tagList.replaceAll("^[;,\\s]+", "").split("[;,\\s]+"))
        {
            if ((currentTag = Tag.findByName(tag)) == null)
            {
                currentTag = new Tag(name: tag)
                currentTag.questions = new ArrayList<Question>()
            }
            currentTag.questions.add(question)
            currentTag.save(flush: true)

            question.tags.add(currentTag)
        }
        return question
    }

    def Question save(Question question, String tagList) {

        question.date = new Date()

        // we don't save tags if question is not valid
        if (!question.save(flush: true))
            return null

        question = assignTags(question, tagList)

        if (!question.save(flush: true))
            return null

        return question
    }

    def get(Long id)
    {
        return Question.get(id)
    }

    def update(Long id, Question newQuestion, String tagList)
    {
        Question question = Question.get(id)

        if (!question)
            return null

        question.title = newQuestion.title
        question.content = newQuestion.content
        question = assignTags(question, tagList)

        if (!question.save(flush: true)) {
            null
        }
        return question
    }

    def delete(Long id)
    {
        def questionInstance = Question.get(id)
        if (!questionInstance) {
            return false
        }

        try {
            questionInstance.delete(flush: true)
            return true
        }
        catch (DataIntegrityViolationException e) {
            return false
        }
    }

    def getScore(Question q)
    {
        int score = 0
        for (QuestionVote v : q.votes)
        {
            score += (v.isPositive?1:-1)
        }

        return score
    }
}
