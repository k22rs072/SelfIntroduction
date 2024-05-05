//
//  ScrollView.swift
//  SelfIntroduction
//
//  Created by KSU Engineearts on 2024/04/30.
//

import SwiftUI

struct MyScrollView: View {
    
    var body: some View {
            NavigationView {
                ScrollView {
                    VStack {
                        ForEach(1...20, id: \.self) { index in
                            NavigationLink(destination: DetailView(item: index)) {
                                Text("Item \(index)")
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(Color.gray)
                                    .cornerRadius(10)
                                    .padding(.horizontal)
                            }
                            .buttonStyle(PlainButtonStyle()) // デフォルトのボタンスタイルを無効化
                        }
                    }
                }
                .navigationTitle("Items")
            }
        }
}

struct DetailView: View {
    let item: Int
    
    var body: some View {
        Text("Detail of Item \(item)")
            .navigationTitle("Item \(item)")
    }
}

struct ScrollView_Previews: PreviewProvider {
    static var previews: some View {
        MyScrollView()
    }
}
