//
//  Game2View.swift
//  SelfIntroduction
//
//  Created by KSU Engineearts on 2024/05/07.
//

import SwiftUI
import AVFoundation


struct Game2View: View {
    @State var size:CGFloat
    
    //    @State var showingPopUp = false
    @State private var x = CGFloat.zero
    @State private var y = CGFloat.zero
    @State private var score = 0
    @State private var remainingSeconds = 10
    @State private var timerIsRunning = false
    @State private var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State private var player: AVAudioPlayer?
  
    var body: some View {
        GeometryReader {geometry in
            ZStack{
                

//                    GeometryReader{geometry2 in
//                        
//                        Image("face")
//                            .resizable()
//                            .scaledToFit()
//                        
//                            .position(x: x,y: y)
//                            .frame(width: size)
//                            .onAppear(){
//                                x = geometry2.frame(in: .local).maxX/2
//                                y = geometry2.frame(in: .local).maxY/2
//                            }
//                            .onTapGesture {
//                                if timerIsRunning {
//                                    playSound()
//                                    x = CGFloat.random(in: geometry2.frame(in: .local).minX + 100...geometry2.frame(in: .local).maxX - 100)
//                                    
//                                    y = CGFloat.random(in: geometry2.frame(in: .local).minY + 100...geometry2.frame(in: .local).maxY - 100)
//                                    score += 1
//                                }else{
//                                    playSound２()
//                                }
//                                
//                            }
//                    }
                faceImageView(x: $x, y: $y, score: $score, timerIsRunning: $timerIsRunning, size: size)
                    .frame(height:geometry.size.height*0.7)
                    
                    
                
                
                VStack{
                    Text("score:\(score)")
                    //                Text("X座標: \(geometry.frame(in: .global).minX),Y座標: \(geometry.frame(in: .global).minY)")
                    Text("\(remainingSeconds)")
                        .font(.largeTitle)
                        .padding()
                    //                CircleImageView(x: $x, y: $y, score: $score, timerIsRunning: $timerIsRunning, size: size)
                    //                    .frame(height:geometry.size.height*0.7)
                    //
                    Spacer()
                    Button(action: {
                        if remainingSeconds == 0   {
                            score = 0
                            remainingSeconds = 10
//                            x = geometry2.frame(in: .local).maxX / 2
//                            y = geometry2.frame(in: .local).maxY / 2
                            
                        }else if remainingSeconds == 10{
                            
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
    }
    struct faceImageView: View {
        @Binding var x: CGFloat
        @Binding var y: CGFloat
        @Binding var score: Int
        @Binding var timerIsRunning: Bool
        
        var size: CGFloat
        
        var body: some View {
            GeometryReader { geometry2 in
                Image("face")
                    .resizable()
                    .scaledToFit()
                    .frame(width: size)
                    .position(x: x, y: y)
                    .onAppear() {
                        x = geometry2.frame(in: .local).maxX / 2
                        y = geometry2.frame(in: .local).maxY / 2
                    }
                    .onTapGesture {
                        if timerIsRunning {
                            playSound()
                            x = CGFloat.random(in: geometry2.frame(in: .local).minX + 100...geometry2.frame(in: .local).maxX - 100)
                            y = CGFloat.random(in: geometry2.frame(in: .local).minY + 100...geometry2.frame(in: .local).maxY - 100)
                            score += 1
                        } else {
                            playSound2()
                        }
                    }
            }
        }
        
        private func playSound() {
            // サウンド再生のコード
        }
        
        private func playSound2() {
            // 別のサウンド再生のコード
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
    Game2View(size:256)
}
