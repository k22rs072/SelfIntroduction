//
//  PopupView.swift
//  SelfIntroduction
//
//  Created by KSU Engineearts on 2024/05/28.
//

import SwiftUI

struct PopupView: View {
    @Binding var isPresent: Bool
    
    var body: some View {
        ZStack{
            Color.gray.opacity(0.5)
                .edgesIgnoringSafeArea(.all)
                .onTapGesture {
                    // ポップアップ以外の背景をタップしたらポップアップを閉じる
                    withAnimation {
                        isPresent = false
                    }
                }
            VStack(spacing: 12) {
                
                HStack{
                    Spacer()
                    Button(action: {
                        withAnimation {
                            isPresent = false
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
                NavigationLink(destination: Game2EasyView()) {
                    Text("easy")
                        .font(.largeTitle)
                        .foregroundStyle(Color.gray)
                        .padding()
                        .background(Color.green, in: RoundedRectangle(cornerRadius: 8))//背景の形と色を決めている
                        .font(.largeTitle)//文字のサイズ
                    
                }
                NavigationLink(destination: Game2View()) {
                    Text("normal")
                        .font(.largeTitle)
                        .foregroundStyle(Color.gray)
                        .padding()
                        .background(Color.yellow, in: RoundedRectangle(cornerRadius: 8))//背景の形と色を決めている
                        .font(.largeTitle)//文字のサイズ
                }
                NavigationLink(destination: Game2HardView()) {
                    Text("hard")
                        .font(.largeTitle)
                        .foregroundStyle(Color.gray)
                        .padding()
                        .background(Color.red, in: RoundedRectangle(cornerRadius: 8))//背景の形と色を決めている
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
        PopupView(isPresent: .constant(true))
    }
}
