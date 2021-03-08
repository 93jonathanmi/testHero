//
//  HeroModel.swift
//  Hero
//
//  Created by Jonathan Lopez on 06/03/21.
//

import Foundation

/*class ModelHeroLite{
    
    var id : String
    var name: String
    
    var fullname: String

    var urlimage: String


    init(id : String,name: String,fullname: String,urlimage: String){
        
        
        self.id = id
        self.name = name
        
        self.fullname = fullname
        
        self.urlimage = urlimage
        
    }
}*/

class ModelHeroLite {
    
    var id : String
    var name: String
    
    var intelligence : String
    var strength: String
    var speed : String
    var durability: String
    var power : String
    var combat: String
    
    var fullname: String
    var alteregos: String
    var aliases: String
    var placeofbirth: String
    var firstappearance: String
    var publisher: String
    var alignment: String
    
    var gender: String
    var race: String
    var height: String
    var weight: String
    var eyecolor: String
    var haircolor: String
    
    var occupation: String
    var base: String
    
    var groupaffiliation: String
    var relatives: String
    
    var urlimage: String


    init(id : String,name: String,intelligence : String,strength: String,speed : String,durability: String,power : String,combat: String,fullname: String,alteregos: String,aliases: String,placeofbirth: String,firstappearance: String,publisher: String,alignment: String,
    gender: String,race: String,height: String,weight: String,eyecolor: String,haircolor: String,occupation: String,base: String,groupaffiliation: String,relatives: String,urlimage: String){
        
        self.id = id
        self.name = name
        
        self.intelligence = intelligence
        self.strength = strength
        self.speed = speed
        self.durability = durability
        self.power = power
        self.combat = combat
        
        self.fullname = fullname
        self.alteregos = alteregos
        self.aliases = aliases
        self.placeofbirth = placeofbirth
        self.firstappearance = firstappearance
        self.publisher = publisher
        self.alignment = alignment
        
        self.gender = gender
        self.race = race
        self.height = height
        self.weight = weight
        self.eyecolor = eyecolor
        self.haircolor = haircolor
        
        self.occupation = occupation
        self.base = base
        
        self.groupaffiliation = groupaffiliation
        self.relatives = relatives
        
        self.urlimage = urlimage
        
    }
}

