//
//  ContentView.swift
//  SelfIntroduction
//
//  Created by Shoichi Suga on 2024/04/25.
//

import SwiftUI

struct ContentView: View {
    @State private var isShowingView: Bool = false
    var body: some View {
        VStack {
            NavigationStack{
                NavigationLink{
                    CounterView()
                    
                } label: {
                    Text("Counter")
                        .font(.largeTitle)
                }
                NavigationLink{
                    JankenView()
                    
                } label: {
                    Text("Janken")
                        .font(.largeTitle)
                }
            }
            Button {
                        isShowingView.toggle()//t、f切り替え
                    } label: {
                        Text("シート")
                    }
                    .sheet(isPresented: $isShowingView) {
                        Voice()//バインディングの値を渡したい＄付く
                    }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
