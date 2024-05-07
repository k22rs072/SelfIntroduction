//
//  TimerView.swift
//  SelfIntroduction
//
//  Created by KSU Engineearts on 2024/05/08.
//

import SwiftUI

struct CountTimerView: View {
    @State private var remainingSeconds = 10
    @State private var timerIsRunning = false
    @State private var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    var body: some View {
        VStack {
            Text("\(remainingSeconds)")
                .font(.largeTitle)
                .padding()

            Button(action: {
                timerIsRunning.toggle()
            }) {
                Text(timerIsRunning ? "Stop" : "Start")
                    .padding()
            }
        }
        .onReceive(timer) { _ in
            if timerIsRunning {
                if remainingSeconds > 0 {
                    remainingSeconds -= 1
                } else {
                    timerIsRunning = false
                }
            }
        }
    }
}

struct TimerView: View {
    var body: some View {
       CountTimerView()
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
    }
}
