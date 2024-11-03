//
//  TrafficLightSystemTests.swift
//  TrafficLightSystemTests
//
//  Created by Georgi Georgiev on 29.10.24.
//

import Testing
@testable import TrafficLightSystem
import SwiftUI
import ViewInspector

struct TrafficLightSystemTests {
    static let invalidCarModel: String = String(repeating: "*", count: Config.minCarModelCharacterLength - 1)
    static let validCarModel: String =  String(repeating: "*", count: Config.minCarModelCharacterLength)

    @Test("SetupCarView ViewModel Car Model Validation", arguments: zip([invalidCarModel, validCarModel],
                                                                    [false, true]))
    func testCarModelValidation(_ carModel: String, _ carModelValid: Bool) async throws {
        let viewModel = await SetupCarView.ViewModel()
        await viewModel.setCarModel(carModel: carModel)
        await #expect(viewModel.isCarModelValid == carModelValid)
    }
    
    

}
