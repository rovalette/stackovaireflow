class UrlMappings {

	static mappings = {
		"/$controller/$action?/$id?"{
			constraints {
				// apply constraints here
			}
		}

        "/"(controller:"Question",action:"list")
		"500"(view:'/error')
        "404"(view:'/error')
	}

}
