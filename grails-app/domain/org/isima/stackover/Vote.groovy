package org.isima.stackover

class Vote {

    Boolean isPositive

    static belongsTo = [votable:Votable, author:Author]

    static constraints = {
        isPositive(blank:false)
        votable(blank:false)
        author(blank:false)
    }
}
