//
//  SwiftUIView.swift
//  Avengers
//
//  Created by Redouane on 25/03/2023.
//

import SwiftUI

struct DisplayTeamView: View {
    @EnvironmentObject var game: Game
    var body: some View {
        
        ForEach(game.player1.characters, id: \.self.id) { character in
            VStack {
                CardView(character: character)
            }
            
            //            ForEach(game.player2.characters, id: \.self.id) { character in
            //                VStack {
            //                    CardView(character: character)
            //                }
            //            }
        }
    

        
        
        Button {
            print("team 1: ")
            for element in game.player1.characters {
                print(element.name)
            }
            
            print("team 2: ")
            for element in game.player2.characters {
                print(element.name)
            }
        } label: {
            Text("show teams")
        }

    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        DisplayTeamView()
    }
}
