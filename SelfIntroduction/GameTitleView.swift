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
                NavigationLink(destination: Game2EasyView()) {
                    Text("easy")
                        .font(.largeTitle)
                        .padding()
                        .background(Color.green, in: RoundedRectangle(cornerRadius: 8))//背景の形と色を決めている
                        .font(.largeTitle)//文字のサイズ
                    
                }
                NavigationLink(destination: Game2View()) {
                    Text("nomal")
                        .font(.largeTitle)
                        .padding()
                        .background(Color.yellow, in: RoundedRectangle(cornerRadius: 8))//背景の形と色を決めている
                        .font(.largeTitle)//文字のサイズ
                    
                }
                NavigationLink(destination: Game2HardView()) {
                    Text("hard")
                        .font(.largeTitle)
                        .padding()
                        .background(Color.red, in: RoundedRectangle(cornerRadius: 8))//背景の形と色を決めている
                        .font(.largeTitle)//文字のサイズ
                    
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
