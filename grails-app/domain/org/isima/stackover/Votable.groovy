package org.isima.stackover

abstract class Votable {

    static hasMany = [votes:Vote]

    static constraints = {
    }
}
