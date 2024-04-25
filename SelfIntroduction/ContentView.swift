//
//  ContentView.swift
//  SelfIntroduction
//
//  Created by Shoichi Suga on 2024/04/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            NavigationStack{
                NavigationLink{
                    CounterView()
                    
                } label: {
                    Text("jojo")
                }
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
