//
//  ViewModel.swift
//  AvengersTests
//
//  Created by Redouane on 18/03/2023.
//

import Foundation


class Game: ObservableObject {
    @Published var player1 : Player
    @Published var player2 : Player
    
    var numberOfCharactersForPlayer1: Int {
        return player1.characters.count
    }
    
    var numberOfCharactersForPlayer2: Int {
        return player2.characters.count
    }
    
    init() {
        self.player1 = Player()
        self.player2 = Player()
    }
    
    func addToPlayer1(_ character: Character){
        self.player1.addCharacter(character)
    }
    
    func renamePlayer1(for id: Int, with newName: String){
        player1.renameCharacter(id: id, name: newName)
    }
    
    func addToPlayer2(_ character: Character){
        self.player2.addCharacter(character)
    }
    
    func renamePlayer2(for id: Int, with newName: String){
        player2.renameCharacter(id: id, name: newName)
    }
    
    static let allCharacters : [Character] = Game.startGame()
    
    static func startGame() -> [Character]{
        var characters : [Character] = []
        for character in Characters.allCases {
            characters.append(character.character)
        }
        return characters
    }
}
