//
//  CounterView.swift
//  SelfIntroduction
//
//  Created by KSU Engineearts on 2024/04/25.
//

import SwiftUI

struct CounterView: View {
    @State var count = 0
    
    
    var body: some View {
        Text("\(count)")
            .font(.largeTitle)
        HStack{
            CountPlusButton()
            CountMinusButton()
        }
        
    }
    
    private func CountPlusButton() -> some View{
        Button(action: {
            count += 1
        }, label: {
            Text("+")
                .padding()//背景の四角の範囲を決めている
                .background(Color.yellow, in: RoundedRectangle(cornerRadius: 8))//背景の形と色を決めている
                .font(.largeTitle)//文字のサイズ
                .foregroundStyle(Color.gray)//文字の色
//            Rectangle()//長方形を描画
//                    .fill(Color.blue)
//                    .frame(width: 100%, height: 200)
        })
    }
    
    private func CountMinusButton() -> some View{
        Button(action: {
            count -= 1
        }, label: {
            Text("-")
                .padding()//背景の四角の範囲を決めている
                .background(Color.yellow, in: RoundedRectangle(cornerRadius: 8))//背景の形と色を決めている
                .font(.largeTitle)//文字のサイズ
                .foregroundStyle(Color.gray)//文字の色
        })
    }
}

#Preview {
    CounterView()
}
