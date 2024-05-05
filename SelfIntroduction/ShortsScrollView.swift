//
//  ShortsScrollView.swift
//  SelfIntroduction
//
//  Created by KSU Engineearts on 2024/04/30.
//

import SwiftUI

struct ShortsScrollView: View {
    @State private var selectedTab = 0
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            TabView(selection: $selectedTab) {
                ForEach(0..<5) { 
                    index in
                    // ここで各コンテンツを表示するViewを指定します
                    Text("Content \(index + 1)")
                        .frame(width: UIScreen.main.bounds.width) // 画面幅いっぱいに表示するためのフレーム指定
                        .tag(index)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        }
    }
    
}
struct ShortsScrollView_Previews: PreviewProvider {
    static var previews: some View {
        ShortsScrollView()
    }
}
