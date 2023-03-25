//
//  TeamSelectionView.swift
//  Avengers
//
//  Created by Redouane on 18/03/2023.
//

import SwiftUI

struct TeamSelectionView: View {
    @StateObject var game: Game = Game()
    @State var presentPopUp = false
    @State var presentRenameScreen = false
    @State var presentNextPlayer = false
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(colors: [Constants.color, .white], startPoint: .top, endPoint: .bottom)
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
                                        game.addToPlayer1(identifiableCharacter)
                                    }
                                    .environmentObject(game)
                                    .padding(.all, 5)
                            }
                        }
                    }
                    Spacer()
                    NavigationLink(destination: RenameView().environmentObject(game).navigationBarBackButtonHidden(true), isActive: $presentRenameScreen) {
                            Button {
                                if game.numberOfCharactersForPlayer1 < 3 {
                                    presentPopUp = true
                                }
                                else {
                                    presentPopUp = false
                                    presentRenameScreen = true
                                }
                            } label: {
                                RoundedRectangle(cornerRadius: 30)
                                    .fill(Constants.color)
                                    .frame(width: 310, height: 50)
                                    .overlay {
                                        Text("RENAME PLAYERS")
                                            .font(.custom(Constants.font, size: 20))
                                            .foregroundColor(.white)
                                    }
                                }
                            
                            }
                        .padding(.bottom, 8)
                    
                    
                    NavigationLink(destination: TeamSelectionViewSecondPlayer().environmentObject(game).navigationBarBackButtonHidden(true), isActive: $presentNextPlayer) {
                            Button {
                                if game.numberOfCharactersForPlayer1 < 3 {
                                    presentPopUp = true
                                }
                                else {
                                    presentPopUp = false
                                    presentNextPlayer = true
                                }
                            } label: {
                                RoundedRectangle(cornerRadius: 30)
                                    .fill(.white)
                                    .frame(width: 310, height: 50)
                                    .overlay {
                                        Text("NEXT PLAYER")
                                            .font(.custom(Constants.font, size: 20))
                                            .foregroundColor(Constants.color)
                                    }
                            }
                            }
                        .padding(.bottom, 8)
                        .sheet(isPresented: $presentPopUp) {
                            ZStack {
                                LinearGradient(colors: [Constants.color, .white], startPoint: .top, endPoint: .bottom)
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


struct TeamSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        TeamSelectionView()
    }
}
