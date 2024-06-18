//
//  ResultView.swift
//  SelfIntroduction
//
//  Created by KSU Engineearts on 2024/05/29.
//

import SwiftUI

struct ResultView: View {
    @Binding var State: Bool
    @State var score: Int
    var body: some View {
        ZStack{
            Color.gray.opacity(0.5)
                .edgesIgnoringSafeArea(.all)
            VStack{
                Text("result")
                    .font(.largeTitle)
                Text("\(score)")
                Button(action: {
                    
                }, label: {
                    Text("Restart")
                })
                Button(action: {
                    
                }, label: {
                    Text("Home")
                })
                
            }
            .frame(width: 280, alignment: .center)
            .padding()
            .background(Color.white)
            .cornerRadius(12)
            
        }
        }
        
}

#Preview {
    ResultView(State: .constant(true),score:0)
}
