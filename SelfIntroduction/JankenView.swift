//
//  JankenView.swift
//  SelfIntroduction
//
//  Created by KSU Engineearts on 2024/04/29.
//

import SwiftUI
//enum Janken: String, CaseIterable{//全ての変数をAllcaseで使えるよ、まとめて変数宣言できるよ
//    case rock = "👊"
//    case scissor = "✌️"
//    case paper = "✋"
//}

enum Constants{
    static let jankenHand = ["rock","scissor","paper"]
    static let result = ["あいこ","負け","勝ち"]
    static let bounds = UIScreen.main.bounds
    static let width = bounds.width
    static let height = bounds.height
}

struct JankenView: View {
    @State private var enemyHand = 0
    @State private var yourHand = 0
    var body: some View {
        VStack{
            Text("\(Constants.jankenHand[enemyHand])")
                .font(.largeTitle)
                .padding()
            HStack{
                JankenButtonView(yourHand: 0)
                JankenButtonView(yourHand: 1)
                JankenButtonView(yourHand: 2)
                //Image(systemName: "popcorn")
//                Image(decorative: "pug")
//                    .resizable()
//                    .scaledToFit()
//                    .frame(width: Constants.width*0.3)
            }
            Text("\(Constants.result[(yourHand - enemyHand + 3)%3])")
//            if yourvalue == 1 && SelectedHand == Janken.scissor.rawValue{
//                Text("kati")
//            }else if yourvalue == 1 && SelectedHand == Janken.paper.rawValue{
//                Text("kati")
//            }else if yourvalue == 2 && SelectedHand == Janken.paper.rawValue{
//                Text("kati")
//            }else if yourvalue == 2 && SelectedHand == Janken.rock.rawValue{
//                Text("make")
//            }else if yourvalue == 3 && SelectedHand == Janken.rock.rawValue{
//                Text("kati")
//            }else if yourvalue == 3 && SelectedHand == Janken.scissor.rawValue{
//                Text("make")
//            }else{
//                Text("aiko")
//            }
            
        }
    }
    private func JankenButtonView(yourHand: Int) -> some View{
        Button(action: {
            self.yourHand = yourHand
            enemyHand =  Int.random(in: 0..<2)
            
        }, label: {
            Text("\(Constants.jankenHand[yourHand])")
        })
    }
}

#Preview {
    JankenView()
}
