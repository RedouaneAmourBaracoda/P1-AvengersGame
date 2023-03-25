//
//  ContentView.swift
//  Avengers
//
//  Created by Redouane on 17/03/2023.
//

import SwiftUI

struct IntroductionView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Image("endgame1")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    Spacer()
                    Text("Avengers Endgame")
                        .font(.custom("Avengero", size: 30))
                        .foregroundColor(.white)
                        .padding(.all)
                    
                    RoundedRectangle(cornerRadius: 30)
                        .strokeBorder(.white ,lineWidth: 4)
                        .frame(width: 360.0, height: 40.0)
                        .overlay {
                            NavigationLink {
                                TeamSelectionView()
                                    .navigationBarBackButtonHidden(true)
                            } label: {
                                Text("START THE GAME")
                                    .foregroundColor(.white)
                                    .font(.custom("Avengero", size: 20))
                                    .multilineTextAlignment(.center)
                                    .padding(.all)
                            }
                        }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        IntroductionView()
    }
}
