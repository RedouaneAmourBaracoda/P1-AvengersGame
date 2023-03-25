//
//  CardView.swift
//  Avengers
//
//  Created by Redouane on 18/03/2023.
//

import SwiftUI

struct CardView: View {
    @State var selected: Bool = false
    @State var color: Color = .white
    let character: Character
    init(character: Character) {
        self.character = character
    }
    var body: some View {
        RoundedRectangle(cornerRadius: 35)
            .strokeBorder(color ,lineWidth:5)
            .frame(width: 200,height: 330)
            .overlay {
                RoundedRectangle(cornerRadius: 30)
                    .fill(.black)
                    .overlay {
                        CharacterView(character: character)
                    }
                    .frame(width: 190,height: 320)
//                    .onTapGesture {
//                        if !alreadySelected {
//                            color = .green
//                            function(self.character)
//                        } else {
//                            color = .white
//                        }
//                        alreadySelected.toggle()
//                    }
            }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        VStack{
            CardView(character: Characters.captain.character)
        }
    }
}
