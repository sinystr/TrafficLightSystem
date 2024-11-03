//
//  TrafficLightSystemApp.swift
//  TrafficLightSystem
//
//  Created by Georgi Georgiev on 29.10.24.
//

import SwiftUI

@main
struct TrafficLightSystemApp: App {
    var body: some Scene {
        WindowGroup {
            SetupCarView(viewModel: .init())
        }
    }
}
