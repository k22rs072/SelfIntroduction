//
//  Voice.swift
//  SelfIntroduction
//
//  Created by KSU Engineearts on 2024/04/25.
//

import SwiftUI

struct Voice: View {
    var body: some View {
        VoiceButton()
    }
    
    private func VoiceButton() -> some View{
        Button(action: {
            
        }, label: {
            Text("voice")
                .padding()//背景の四角の範囲を決めている,順序が大事、テキストに余白を足した分に背景が付いている
                .background(Color.yellow, in: RoundedRectangle(cornerRadius: 8))//背景の形と色を決めている
                .font(.largeTitle)//文字のサイズ
                .foregroundStyle(Color.gray)//文字の色
        })
    }

}

#Preview {
    Voice()
}
