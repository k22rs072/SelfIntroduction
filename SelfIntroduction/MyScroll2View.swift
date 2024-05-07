//
//  MyScroll2View.swift
//  SelfIntroduction
//
//  Created by KSU Engineearts on 2024/05/05.
//

import SwiftUI

struct MyScroll2View: View {
    @State private var dragOffsetY: CGFloat = 0
    @State private var isNextViewActive = false

    var body: some View {
        GeometryReader { geometry in // GeometryReaderを使用して画面全体のサイズを取得
            ZStack {
                Color.clear // 背景を透明にしてドラッグ操作を可能に
                VStack {
                    if !isNextViewActive {
                        Rectangle() // 円を消してRectangleに変更
                            .frame(width: 100, height: 100)
                            .foregroundColor(.clear) // 背景色を透明に
                            .contentShape(Rectangle()) // コンテンツの形状をRectangleに設定
                            .offset(y: self.dragOffsetY)
                            .gesture(
                                DragGesture()
                                    .onChanged { gesture in
                                        self.dragOffsetY = gesture.translation.height
                                    }
                                    .onEnded { gesture in
                                        if abs(self.dragOffsetY) > 100 {
                                            withAnimation {
                                                self.isNextViewActive = true
                                            }
                                        } else {
                                            withAnimation {
                                                self.dragOffsetY = 0
                                            }
                                        }
                                    }
                            )
                            .padding()
                    } else {
                        NextView(isActive: $isNextViewActive)
                    }
                }
                .frame(width: geometry.size.width, height: geometry.size.height)
            }
        }
    }
}
struct NextView: View {
    @Binding var isActive: Bool

    var body: some View {
        VStack {
            Text("Next View")
            Button("Go Back") {
                withAnimation {
                    isActive = false
                }
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MyScroll2View()
    }
}
