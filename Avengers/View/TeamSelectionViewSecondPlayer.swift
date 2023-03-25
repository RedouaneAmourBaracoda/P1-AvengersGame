//
//  NextPlayerView.swift
//  Avengers
//
//  Created by Redouane on 23/03/2023.
//

import SwiftUI

struct TeamSelectionViewSecondPlayer: View {
    @EnvironmentObject var game: Game
    @State var presentPopUp = false
    @State var presentRenameScreen = false
    @State var presentLetsFightScreen = false
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(colors: [.red, .white], startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                VStack{
                    Text("Scroll and select 3 characters")
                        .font(.custom(Constants.font, size: 25))
                        .foregroundColor(.white)
                        .lineSpacing(10)
                        .multilineTextAlignment(.center)
                        .padding(.top, 30)
                    Spacer()
                    ScrollView(.horizontal) {
                        HStack(){
                            ForEach(Game.allCharacters, id: \.self.id){ identifiableCharacter in
                                CardView(character: identifiableCharacter)
                                    .onTapGesture {
                                        print(identifiableCharacter.name)
                                        game.addToPlayer2(identifiableCharacter)
                                    }
                                    .environmentObject(game)
                                    .padding(.all, 5)
                            }
                        }
                    }
                    Spacer()
                    NavigationLink(destination: RenameView2().environmentObject(game).navigationBarBackButtonHidden(true), isActive: $presentRenameScreen) {
                            Button {
                                if game.numberOfCharactersForPlayer2 < 3 {
                                    presentPopUp = true
                                }
                                else {
                                    presentPopUp = false
                                    presentRenameScreen = true
                                }
                            } label: {
                                RoundedRectangle(cornerRadius: 30)
                                    .fill(.pink)
                                    .frame(width: 310, height: 50)
                                    .overlay {
                                        Text("RENAME PLAYERS")
                                            .font(.custom(Constants.font, size: 20))
                                            .foregroundColor(.white)
                                    }
                                }
                            
                            }
                        .padding(.bottom, 8)
                    
                    
                    NavigationLink(destination: DisplayTeamView().environmentObject(game).navigationBarBackButtonHidden(true), isActive: $presentLetsFightScreen) {
                            Button {
                                if game.numberOfCharactersForPlayer2 < 3 {
                                    presentPopUp = true
                                }
                                else {
                                    presentPopUp = false
                                    presentLetsFightScreen = true
                                }
                            } label: {
                                RoundedRectangle(cornerRadius: 30)
                                    .fill(.white)
                                    .frame(width: 310, height: 50)
                                    .overlay {
                                        Text("Let's fight!")
                                            .font(.custom(Constants.font, size: 20))
                                            .foregroundColor(.pink)
                                    }
                            }
                            }
                        .padding(.bottom, 8)
                        .sheet(isPresented: $presentPopUp) {
                            ZStack {
                                LinearGradient(colors: [.red, .white], startPoint: .top, endPoint: .bottom)
                                    .ignoresSafeArea()
                                Text("You must select 3 characters to move on")
                                    .font(.custom(Constants.font, size: 25))
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(.white)
                                    .presentationDetents([.fraction(0.25)])
                            }
                    }
                }
            }
        }
    }
}

struct TeamSelectionViewSecondPlayer_Previews: PreviewProvider {
    static var previews: some View {
        TeamSelectionViewSecondPlayer()
    }
}
