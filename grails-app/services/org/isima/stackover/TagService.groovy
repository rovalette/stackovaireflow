package org.isima.stackover

class TagService {

    def findAll() {
        return Tag.findAll()
    }

    def get(Serializable id)
    {
        return Tag.get(id)
    }
}
