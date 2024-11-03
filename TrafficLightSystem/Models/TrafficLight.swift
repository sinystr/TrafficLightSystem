//
//  TrafficLight.swift
//  TrafficLightSystem
//
//  Created by Georgi Georgiev on 31.10.24.
//

import Foundation

enum TrafficLight: Int {
    case green
    case orange
    case red
    
    var duration: TimeInterval {
        switch self {
        case .red:
            Config.redLightDuration
        case .orange:
            Config.orangeLightDuration
        case .green:
            Config.greenLightDuration
        }
    }

}
