package org.isima.stackover

import org.codehaus.groovy.ast.InterfaceHelperClassNode


abstract class Comment {
	
	String content
	Date date
	
	static belongsTo = [author:Author]

    static constraints = {
		author(blank:false)
		content(blank:false)
    }
}
