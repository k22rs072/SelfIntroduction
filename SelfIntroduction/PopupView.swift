//
//  PopupView.swift
//  SelfIntroduction
//
//  Created by KSU Engineearts on 2024/05/28.
//

import SwiftUI

struct PopupView: View {
    @Binding var Present: Bool
    
    var body: some View {
        ZStack{
            Color.gray.opacity(0.5)
                .edgesIgnoringSafeArea(.all)
                .onTapGesture {
                    // ポップアップ以外の背景をタップしたらポップアップを閉じる
                    withAnimation {
                        Present = false
                    }
                }
            VStack(spacing: 12) {
                
                HStack{
                    Spacer()
                    Button(action: {
                        withAnimation {
                            Present = false
                        }
                    }, label: {
                        Image(systemName: "xmark.circle")
                            .font(.largeTitle)
                            .foregroundColor(.red)
                    })

                }
                
                Text("Difficulty Level")
                    .font(.largeTitle)
                
                
//                Image("face")
//                    .resizable()
//                    .frame(width: 80, height: 80)
                NavigationLink(destination: Game2View(size: 1024)) {
                    Text("easy")
                        .frame(width:256)
                        .font(.largeTitle)
                        .foregroundStyle(.gray)
                        .padding()
                        .background(.green, in: RoundedRectangle(cornerRadius: 8))//背景の形と色を決めている
                        .font(.largeTitle)//文字のサイズ
                    
                }
                NavigationLink(destination: Game2View(size: 256)) {
                    Text("normal")
                        .frame(width:256)
                        .font(.largeTitle)
                        .foregroundStyle(.gray)
                        .padding()
                        .background(.yellow, in: RoundedRectangle(cornerRadius: 8))//背景の形と色を決めている
                        .font(.largeTitle)//文字のサイズ
                }
                NavigationLink(destination: Game2View(size: 64)) {
                    Text("hard")
                        .frame(width:256)
                        .font(.largeTitle)
                        .foregroundStyle(.gray)
                        .padding()
                        .background(.red, in: RoundedRectangle(cornerRadius: 8))//背景の形と色を決めている
                        .font(.largeTitle)//文字のサイズ
                    
                }
                
                
                
            }
            .frame(width: 280, alignment: .center)
            .padding()
            .background(Color.white)
            .cornerRadius(12)
        }
    }
}


struct PopupView_Previews: PreviewProvider {
    static var previews: some View {
        PopupView(Present: .constant(true))
    }
}
