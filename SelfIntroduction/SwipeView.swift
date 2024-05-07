//
//  SwipeView.swift
//  SelfIntroduction
//
//  Created by KSU Engineearts on 2024/05/01.
//

import SwiftUI

struct SwipeView: View {
    @State private var isShowingSecondView = false
    var body: some View {
        ZStack {
                    if isShowingSecondView {
                        SecondView(isShowing: $isShowingSecondView)
//                            .transition(.move(edge: .trailing))
                    } else {
                        FirstView()
//                            .transition(.move(edge: .leading))
                    }
                }
                .gesture(
                    DragGesture()
                        .onEnded { gesture in
                            if gesture.translation.height < -100 {
                                withAnimation {
                                    self.isShowingSecondView = true
                                }
                            } else if gesture.translation.height > 100 {
                                withAnimation {
                                    self.isShowingSecondView = false
                                }
                            }
                        }
                )
    }
}
struct FirstView: View {
    var body: some View {
        ZStack {
            Color.red.edgesIgnoringSafeArea(.all)
            Text("First View")
                .foregroundColor(.white)
                .font(.title)
        }
    }
}

struct SecondView: View {
    @Binding var isShowing: Bool
    
    var body: some View {
        ZStack {
            Color.green.edgesIgnoringSafeArea(.all)
            Text("Second View")
                .foregroundColor(.white)
                .font(.title)
        }
        .gesture(
            DragGesture()
                .onEnded { gesture in
                    if gesture
                        .translation.height < -100 {
                        withAnimation {
                            self.isShowing = false
                        }
                    }
                }
        )
    }
}

struct SwipeView_Previews: PreviewProvider {
    static var previews: some View {
        SwipeView()
    }
}
