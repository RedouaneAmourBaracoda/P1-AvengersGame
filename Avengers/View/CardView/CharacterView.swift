//
//  CaptainView.swift
//  Avengers
//
//  Created by Redouane on 18/03/2023.
//

import SwiftUI

struct CharacterView: View {
    let character: Character
    init(character: Character) {
        self.character = character
    }
    var body: some View {
        ZStack {
            Image("card-background")
                .resizable()
                .frame(width: 160, height: 270)
            VStack{
                HeaderView(characterNumber: character.id, name: character.name)
                CentralView(character: character)
                BottomView(description: character.description)
                    .padding(.all)
                
            }
            .padding(.top)
        }
    }
}

struct HeaderView: View {
    let characterNumber: Int
    let name : String
    init(characterNumber: Int, name: String) {
        self.characterNumber = characterNumber
        self.name = name
    }
    var body: some View {
        HStack{
            Text(name)
                .foregroundColor(.yellow)
                .font(.custom(Constants.font, size: 15))
                .multilineTextAlignment(.center)
//            Spacer()
//            Circle()
//                .strokeBorder(Color(.red), lineWidth: 3)
//                .frame(width: 25, height: 25)
//                .overlay {
//                    Text(String(characterNumber))
//                        .foregroundColor(.red)
//                        .font(.custom(Constants.font, size: 12))
//                        .multilineTextAlignment(.center)
//                }
//                .padding(.trailing)
        }
    }
}

struct CentralView: View {
    let character: Character
    var properties : [Property] {
        return [Property(number: Float(character.life)/100.0, text: "Life"),
                Property(number: Float(character.weapon)/100.0, text: "Weapon"),
                Property(number: Float(character.defense)/100.0, text: "Defense"),
                Property(number: 0.5, text: "Speed")
        ]
    }
    static let fontSize: Int = 9
    init(character: Character) {
        self.character = character
    }
    var body: some View {
        HStack {
            Image(character.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 90, height: 200)
                .padding(.leading)
            VStack {
                ForEach(properties) { property in
                    PropertyView(property: property)
                    
                }
            }
        }
    }
}

struct Property: Identifiable {
    let number : Float
    let text : String
    let id = UUID()
    init(number: Float, text: String) {
        self.number = number
        self.text = text
    }
}

struct PropertyView: View {
    let property : Property
    init(property: Property) {
        self.property = property
    }
    var body: some View {
        VStack {
            ProgressView(value: property.number) {
                Text(property.text)
                    .font(.custom(Constants.font, size: CGFloat(CentralView.fontSize)))
                    .foregroundColor(.yellow)
            }
                .tint(.yellow)
                .frame(width: (50))
        }
        
    }
}


struct BottomView: View {
    let description: String
    var body: some View {
        Text(description)
            .foregroundColor(.red)
            .font(.custom("Avengero", size: 7))
            .multilineTextAlignment(.center)
    }
}


struct CaptainView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            HStack {
                CharacterView(character: Characters.captain.character)
            }
            HStack {

            }
        }
    }
}





