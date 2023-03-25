//
//  Personnage.swift
//  Avengers
//
//  Created by Redouane on 17/03/2023.
//

import Foundation
import UIKit


enum Characters: CaseIterable {
    case captain
    case thor
    case thanos
    case doctorStrange
    
    var character: Character {
        switch self {
        case .captain:
            return Character(name: Characters.captain.name, life: Characters.captain.startingLife, weapon: Characters.captain.weapon, defense: Characters.captain.defense, image: Characters.captain.image, description: Characters.captain.description, id: Characters.captain.id)
        case .thor:
            return Character(name: Characters.thor.name, life: Characters.thor.startingLife, weapon: Characters.thor.weapon, defense: Characters.thor.defense, image: Characters.thor.image, description: Characters.thor.description, id: Characters.thor.id)
        case .thanos:
            return Character(name: Characters.thanos.name, life: Characters.thanos.startingLife, weapon: Characters.thanos.weapon, defense: Characters.thanos.defense, image: Characters.thanos.image, description: Characters.thanos.description, id: Characters.thanos.id)
        case .doctorStrange:
            return Character(name: Characters.doctorStrange.name, life: Characters.doctorStrange.startingLife, weapon: Characters.doctorStrange.weapon, defense: Characters.doctorStrange.defense, image: Characters.doctorStrange.image, description: Characters.doctorStrange.description, id: Characters.doctorStrange.id)
        }
    }
    
    var name: String {
        switch self {
        case .captain:
            return "Captain"
        case .thor:
            return "Thor"
        case .thanos:
            return "Thanos"
        case .doctorStrange:
            return "Doctor strange"
        }
    }
    
    var id: Int {
        switch self {
        case .captain:
            return 1
        case .thor:
            return 2
        case .thanos:
            return 3
        case .doctorStrange:
            return 4
        }
    }
    
    var image: String {
        switch self {
        case .captain:
            return "Captain"
        case .thor:
            return "Thor"
        case .thanos:
            return "Thanos"
        case .doctorStrange:
            return "Doctor-strange"
        }
    }
    
    var description: String {
        switch self {
        case .captain:
            return "Thoughest defender with a strongly resistent shield made of vibranium."
        case .thor:
            return "Thunder master with powerful lightning strike, his hammer can severely kill you."
        case .thanos:
            return "Thanos is the most dangerous evil creature ever made, almost unbeatable."
        case .doctorStrange:
            return "Greatest healing power, doctor strange has the ability to resuscitate."
        }
    }
    
    var startingLife: Float {
        switch self {
        case .captain:
            return 80.0
        case .thor:
            return 60.0
        case .thanos:
            return 50.0
        case .doctorStrange:
            return 90.0
        }
    }
    
    var weapon: Float {
        switch self {
        case .captain:
            return 30.0
        case .thor:
            return 50.0
        case .thanos:
            return 55.0
        case .doctorStrange:
            return 20.0
        }
    }
    
    var defense: Float {
        switch self {
        case .captain:
            return 20.0
        case .thor:
            return 10.0
        case .thanos:
            return 30.0
        case .doctorStrange:
            return 5.0
        }
    }
}

struct Character {
    var name: String
    var life: Float
    let weapon: Float
    let defense: Float
    let image : String
    let description: String
    let id: Int
    
    init(name: String, life: Float, weapon: Float, defense: Float, image: String, description: String, id: Int) {
        self.name = name
        self.life = life
        self.weapon = weapon
        self.defense = defense
        self.image = image
        self.description = description
        self.id = id
    }
    
    mutating func renameCharacter(_ rename: String){
        self.name = rename
    }
    
    mutating func attacked (by character: Character) {
        self.life -= character.weapon
    }
}
