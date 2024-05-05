//
//  MyScroll2View.swift
//  SelfIntroduction
//
//  Created by KSU Engineearts on 2024/05/05.
//

import SwiftUI

struct MyScroll2View: View {
    @State private var offsetY: CGFloat = 0
        @State private var isNextViewActive = false

        var body: some View {
            VStack {
                if !isNextViewActive {
                    Circle()
                        .frame(width: 100, height: 100)
                        .foregroundColor(.blue)
                        .offset(y: offsetY)
                        .gesture(
                            DragGesture()
                                .onChanged { gesture in
                                    self.offsetY = gesture.translation.height
                                }
                                .onEnded { gesture in
                                    if abs(self.offsetY) > 100 {
                                        withAnimation {
                                            self.isNextViewActive = true
                                        }
                                    } else {
                                        withAnimation {
                                            self.offsetY = 0
                                        }
                                    }
                                }
                        )
                        .padding()
                } else {
                    NextView(isActive: $isNextViewActive)
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
