//
//  SetupCarViewModel.swift
//  TrafficLightSystem
//
//  Created by Georgi Georgiev on 29.10.24.
//

import SwiftUI

extension SetupCarView {
    
    @Observable @MainActor class ViewModel {
        var carModel: String = ""

        var isCarModelValid: Bool {
            carModel.count >= Config.minCarModelCharacterLength
        }
        
        func setCarModel(carModel: String) {
            self.carModel = carModel
        }
    }

}
