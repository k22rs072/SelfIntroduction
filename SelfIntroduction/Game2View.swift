//
//  Game2View.swift
//  SelfIntroduction
//
//  Created by KSU Engineearts on 2024/05/07.
//

import SwiftUI



struct Game2View: View {
    @State private var x = CGFloat.zero
    @State private var y = CGFloat.zero
    var body: some View {
        GeometryReader {geometry in
            
            VStack{
                Text("X座標: \(geometry.frame(in: .global).minX),Y座標: \(geometry.frame(in: .global).minY)")
                
                Circle()
                    .frame(width: 100,height: 100)
                    .position(x: x,y: y)
                    .onTapGesture {
                                            // 円がタップされたときに x を更新する
                        x = CGFloat.random(in: geometry.frame(in: .global).minX...geometry.frame(in: .global).maxX)
                        
                        y = CGFloat.random(in: geometry.frame(in: .global).minY...geometry.frame(in: .global).maxY)
                        
                                        }
                
            }
            
        }
        
        
        
    }
}

#Preview {
    Game2View()
}
