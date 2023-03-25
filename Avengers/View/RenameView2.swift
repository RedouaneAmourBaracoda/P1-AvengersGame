//
//  RenameView2.swift
//  Avengers
//
//  Created by Redouane on 25/03/2023.
//

import SwiftUI

struct RenameView2: View {
    @EnvironmentObject var game: Game
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(colors: [.red, .white], startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                VStack{
                    Text("Select and rename")
                        .font(.custom(Constants.font, size: 25))
                        .foregroundColor(.white)
                        .lineSpacing(10)
                        .multilineTextAlignment(.center)
                        .padding(.top, 30)
                    Spacer()
                    ScrollView(.horizontal) {
                        HStack(){
                            ForEach(game.player2.characters, id: \.self.id){ identifiableCharacter in
                                renamableCard2(character: identifiableCharacter)
                                    .environmentObject(game)
                                    .padding(.all, 5)
                            }
                        }
                    }
                    Spacer()
                    NavigationLink {
                            DisplayTeamView()
                            .environmentObject(game)
                            .navigationBarBackButtonHidden(true)
                        } label: {
                            RoundedRectangle(cornerRadius: 30)
                                .fill(.white)
                                .frame(width: 310, height: 50)
                                .overlay {
                                    Text("Lets fight")
                                        .font(.custom(Constants.font, size: 20))
                                        .foregroundColor(.pink)
                                }
                        }
                        .padding(.bottom)
                }
            }
        }
    }
}

struct renamableCard2: View {
    @EnvironmentObject var game : Game
    let character: Character
    @State var name: String = ""
    var body: some View {
        VStack {
            CardView(character: character)
            TextField(character.name, text: $name)
                .textFieldStyle(.roundedBorder)
        }
        .onSubmit {
            game.renamePlayer2(for: character.id, with: name)
        }
    }
}

struct RenameView2_Previews: PreviewProvider {
    static var previews: some View {
        RenameView2()
    }
}
