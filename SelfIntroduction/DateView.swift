//
//  DateView.swift
//  SelfIntroduction
//
//  Created by KSU Engineearts on 2024/05/13.
//

import SwiftUI

struct DateView: View {
    @State private var currentDate = Date()

    var body: some View {
        VStack {
            Text("現在日付: \(formattedDate())")
            Text("現在時刻: \(formattedTime())")
        }
        .onAppear {
            let timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
                self.currentDate = Date()
            }
            RunLoop.current.add(timer, forMode: .common)
        }
    }

    func formattedTime() -> String {
        let formatter = DateFormatter()
        formatter.timeStyle = .medium
        return formatter.string(from: currentDate)
    }
    
    func formattedDate() -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: currentDate)
    }
}

struct DateView_Previews: PreviewProvider {
    static var previews: some View {
        DateView()
    }
}
