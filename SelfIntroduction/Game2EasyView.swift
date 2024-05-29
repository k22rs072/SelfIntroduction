//
//  Game2EasyView.swift
//  SelfIntroduction
//
//  Created by KSU Engineearts on 2024/05/08.
//

import SwiftUI

import AVFoundation


struct Game2EasyView: View {
    
    @State private var x = CGFloat.zero
    @State private var y = CGFloat.zero
    @State private var score = 0
    @State private var remainingSeconds = 10
    @State private var timerIsRunning = false
    @State private var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State private var player: AVAudioPlayer?

    var body: some View {
        GeometryReader {geometry in
            VStack{
                
                Text("score:\(score)")
//                Text("X座標: \(geometry.frame(in: .global).minX),Y座標: \(geometry.frame(in: .global).minY)")
                Text("\(remainingSeconds)")
                    .font(.largeTitle)
                    .padding()
                
                   
            
                
                Image(decorative: "face")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 1026)
                    .position(x: x,y: y)
                    .onAppear(){
                        x = geometry.size.width/2
                        y = geometry.size.height/2
                    }
                    .onTapGesture {
                                            // 円がタップされたときに x を更新する
                        if timerIsRunning {
                            playSound()
                            x = CGFloat.random(in: geometry.frame(in: .global).minX + 100...geometry.frame(in: .global).maxX - 100)
                            
                            y = CGFloat.random(in: geometry.frame(in: .global).minY + 100...geometry.frame(in: .global).maxY - 100)
                            score += 1
                            
                        }else{
                            playSound２()
                        }
                        
                     }
                Button(action: {
                    if remainingSeconds == 0   {
                        score = 0
                        remainingSeconds = 10
                        
                        
                    }else if remainingSeconds == 10{
                        x = geometry.size.width/2
                        y = geometry.size.height/2
                        timerIsRunning.toggle()
                    }
                    
                }) {
                    Text("Start")
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
    func playSound() {
            guard let url = Bundle.main.url(forResource: "voice2", withExtension: "mp3") else { return }
            
            do {
                player = try AVAudioPlayer(contentsOf: url)
                player?.play()
            } catch {
                print("Error playing sound: \(error.localizedDescription)")
            }
        }
    func playSound２() {
            guard let url = Bundle.main.url(forResource: "voice1", withExtension: "mp3") else { return }
            
            do {
                player = try AVAudioPlayer(contentsOf: url)
                player?.play()
            } catch {
                print("Error playing sound: \(error.localizedDescription)")
            }
        }
}

#Preview {
    Game2EasyView()
}

