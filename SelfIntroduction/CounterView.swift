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
        CountPlusButton()
    }
    
    private func CountPlusButton() -> some View{
        Button(action: {
            count += 1
        }, label: {
            Text("+")
        })
    }
    
    private func CountMinusButton() -> some View{
        Button(action: {
            count -= 1
        }, label: {
            Text("-")
        })
    }
}

#Preview {
    CounterView()
}
