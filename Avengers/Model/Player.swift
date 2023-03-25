//
//  Player.swift
//  Avengers
//
//  Created by Redouane on 19/03/2023.
//

import Foundation

struct Player {
    var characters : [Character] = []

    mutating func addCharacter(_ character: Character){
        if self.characters.count < 3 && !characterAlreadyPresent(character: character){
            characters.append(character)
        }
    }
    
    func characterAlreadyPresent(character: Character) -> Bool { // Returns true if character is has already been selected in characters.
        var output = false
        for element in characters {
            if element.id == character.id {
                output = true || output
            } else {
                output = false && output
            }
        }
        print("output: \(output)")
        return output
    }
    
    mutating func renameCharacter(id: Int, name: String){
        for i in characters.indices {
            if characters[i].id == id {
                characters[i].name = name
            }
        }
    }
}
