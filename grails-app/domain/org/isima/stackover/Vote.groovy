package org.isima.stackover

class Vote {

    Boolean isPositive

    static belongsTo = [author:Author]

    static constraints = {
        isPositive(blank:false)
        author(blank:false)
    }
}
