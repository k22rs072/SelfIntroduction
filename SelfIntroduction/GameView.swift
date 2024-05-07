//
//  GameView.swift
//  SelfIntroduction
//
//  Created by KSU Engineearts on 2024/05/07.
//

import SwiftUI

struct Mole: Identifiable {
    var id = UUID()
    var isActive: Bool = false
}

struct GameView: View {
    @State private var moles = Array(repeating: Mole(), count: 9)
    @State private var score = 0
    
    func onTap(index: Int) {
        if moles[index].isActive {
            score += 1
            moles[index].isActive = false
        }
    }
    
    func resetGame() {
        moles = Array(repeating: Mole(), count: 9)
        score = 0
        startGame()
    }
    
    func startGame() {
        let moleIndex = Int.random(in: 0..<moles.count)
        moles[moleIndex].isActive = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.moles[moleIndex].isActive = false
            if self.score < 10 {
                self.startGame()
            }
        }
    }
    
    var body: some View {
        VStack {
            Text("Score: \(score)")
                .font(.title)
                .padding()
            
            GridView(items: moles, columns: 3) { mole, index in
                Image(systemName: mole.isActive ? "circle.fill" : "circle")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .foregroundColor(mole.isActive ? .red : .gray)
                    .onTapGesture {
                        self.onTap(index: index)
                    }
            }
            
            Button("Start Game") {
                self.resetGame()
            }
            .padding()
        }
        .onAppear {
            self.startGame()
        }
    }
}

struct GridView<Content: View, T: Identifiable>: View {
    let items: [T]
    let columns: Int
    let content: (T, Int) -> Content
    
    var rows: Int {
        (items.count - 1) / columns + 1
    }
    
    var body: some View {
        VStack {
            ForEach(0..<rows) { rowIndex in
                HStack {
                    ForEach(0..<self.columns) { columnIndex in
                        if let index = self.indexFor(row: rowIndex, column: columnIndex) {
                            self.content(self.items[index], index)
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                        } else {
                            Spacer()
                        }
                    }
                }
            }
        }
    }
    
    func indexFor(row: Int, column: Int) -> Int? {
        let index = row * self.columns + column
        return index < self.items.count ? index : nil
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
