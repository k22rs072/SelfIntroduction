//
//  MyScroll3View.swift
//  SelfIntroduction
//
//  Created by KSU Engineearts on 2024/05/06.
//

import SwiftUI
import AVKit

struct VideoPlayerView: View {
    var body: some View {
        if let videoURL = Bundle.main.url(forResource: "mov_hts-samp003", withExtension: "mp4") {
                    VideoPlayer(player: AVPlayer(url: videoURL))
                        .edgesIgnoringSafeArea(.all)
                } else {
                    Text("動画ファイルが見つかりません")
                }
    }
}
struct MyScroll3View: View {
    @State private var videos = ["video1", "video2", "video3"] // 仮の動画のリスト
    @State private var currentIndex = 0

    var body: some View {
        VStack {
            Text("Current Video: \(videos[currentIndex])")
                .padding()
            VideoPlayerView()
            Spacer()
            
            Rectangle() // 仮の動画表示領域
                .foregroundColor(.gray)
                .frame(height: 300)
                .onTapGesture {
                    // 画面をタップしたら次の動画に移動
                    nextVideo()
                }
                .gesture(
                    DragGesture()
                        .onEnded { value in
                            if value.translation.height < 0 {
                                // 上にスワイプした場合、次の動画に移動
                                nextVideo()
                            } else if value.translation.height > 0 {
                                // 下にスワイプした場合、前の動画に移動
                                previousVideo()
                            }
                        }
                )
            
            Spacer()
        }
    }
    
    func nextVideo() {
        currentIndex = (currentIndex + 1) % videos.count
    }
    
    func previousVideo() {
        currentIndex = (currentIndex - 1 + videos.count) % videos.count
    }
}

struct MyScroll3View_Previews: PreviewProvider {
    static var previews: some View {
        MyScroll3View()
    }
}
