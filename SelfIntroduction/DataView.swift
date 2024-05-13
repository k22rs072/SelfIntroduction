//
//  DataView.swift
//  SelfIntroduction
//
//  Created by KSU Engineearts on 2024/05/12.
//

import SwiftUI


extension UserDefaults {
    enum ThemeKey {
        static let selectedColor = "selectedColor"
    }
}

struct DataView: View {
    @ObservedObject var themeViewModel = ThemeViewModel()
    
    var body: some View {
        VStack {
            Text("Select Theme Color:")
            ColorPicker("Theme Color", selection: $themeViewModel.selectedColor)
                .padding()
        }
    }
}

class ThemeViewModel: ObservableObject {
    // UserDefaultsを介して保存された選択されたテーマカラーを取得する
    var selectedColor: Color {
        get {
            if let colorData = UserDefaults.standard.data(forKey: UserDefaults.ThemeKey.selectedColor),
               let color = try? NSKeyedUnarchiver.unarchivedObject(ofClass: UIColor.self, from: colorData) {
                return Color(color)
            }
            // デフォルトのテーマカラーを返す
            return .blue
        }
        set {
            // 選択されたテーマカラーをUserDefaultsに保存する
            if let colorData = try? NSKeyedArchiver.archivedData(withRootObject: UIColor(newValue), requiringSecureCoding: false) {
                UserDefaults.standard.set(colorData, forKey: UserDefaults.ThemeKey.selectedColor)
            }
        }
    }
}

#Preview {
    DataView()
}
