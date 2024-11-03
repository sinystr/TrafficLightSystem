//
//  AnimatedTrafficLightView.swift
//  TrafficLightSystem
//
//  Created by Georgi Georgiev on 31.10.24.
//

import SwiftUI

struct AnimatedTrafficLightView: View {
    @State private var currentLight: TrafficLight = .green

    var body: some View {
        VStack(spacing: 0) {
            VStack(spacing: 15) {
                LightBulbView(isOn: currentLight == TrafficLight.green, color: .green)
                LightBulbView(isOn: currentLight == TrafficLight.orange, color: .orange)
                LightBulbView(isOn: currentLight == TrafficLight.red, color: .red)
            }
            .padding(20)
            .overlay(
                RoundedRectangle(cornerSize: .init(width: 20, height: 20))
                    .stroke(Color.gray, lineWidth: 3)
            )
            
            Rectangle()
                .frame(width: 20, height: 40)
                .foregroundColor(.gray)
                .shadow(color: .gray, radius: 4)
        }
        .padding()
        .onAppear {
            animateTrafficLight()
        }
    }
    
    private func animateTrafficLight() {
        DispatchQueue.main.asyncAfter(deadline: .now() + currentLight.duration) {

            withAnimation {
                let nextLightRawValue = currentLight.rawValue + 1 > 2 ? 0 : currentLight.rawValue + 1
                guard let currentLight = TrafficLight(rawValue: nextLightRawValue) else {
                    return
                }
                self.currentLight = currentLight
            } completion: {
                animateTrafficLight()
            }
        }
    }
}

#Preview {
    AnimatedTrafficLightView()
}
