package org.isima.stackover

class TagController {

    def tagService

    def list() {
        [tagList: tagService.findAll()]
    }

    def show(){
        Tag tagInstance = tagService.get(params.id)

        [tag: tagInstance]
    }
}
