package org.isima.stackover

import org.codehaus.groovy.ast.InterfaceHelperClassNode


abstract class Comment {
	
	static belongsTo = [author:Author]

    static constraints = {
		author(blank:false)
    }
}
