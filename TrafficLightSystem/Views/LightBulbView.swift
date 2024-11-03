//
//  LightBulbView.swift
//  TrafficLightSystem
//
//  Created by Georgi Georgiev on 31.10.24.
//

import SwiftUI

struct LightBulbView: View {
    let isOn: Bool
    let color: Color

    var body: some View {
        Circle()
            .foregroundColor(color)
            .opacity(isOn ? 1.0 : 0.2)
            .overlay(Circle().stroke( isOn ? .blue : Color(uiColor: .systemGray3), lineWidth: 3))
            .shadow(color: isOn ? color.opacity(0.5) : .clear, radius: 20)
    }
}

#Preview {
    LightBulbView(isOn: false, color: .red)
    LightBulbView(isOn: false, color: .yellow)
    LightBulbView(isOn: true, color: .green)
}

