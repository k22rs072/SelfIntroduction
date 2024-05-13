//
//  TextDataView.swift
//  SelfIntroduction
//
//  Created by KSU Engineearts on 2024/05/13.
//

import SwiftUI


struct TextDataView: View {
    @AppStorage("testKey") var testAppStorage = ""
    var body: some View {
        VStack {
                TextField("input text", text: $testAppStorage)
                Text(testAppStorage)
                Button {
                    testAppStorage.removeAll()
                } label: {
                    Text("削除")
                }
            }
    }
}

#Preview {
    TextDataView()
}
