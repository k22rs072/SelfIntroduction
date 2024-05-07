//
//  GameTitleView.swift
//  SelfIntroduction
//
//  Created by KSU Engineearts on 2024/05/08.
//

import SwiftUI

struct GameTitleView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("GameTitle")
                    .font(.largeTitle)
                NavigationLink(destination: Game2View()) {
                    Text("Game")
                        .font(.largeTitle)
                }
            }
            
        }
    }
}


//struct GameTitleView_Previews: PreviewProvider {
//    static var previews: some View {
//        GameTitleView()
//    }
//}
#Preview {
    GameTitleView()
}
