//
//  TrafficLightView.swift
//  TrafficLightSystem
//
//  Created by Georgi Georgiev on 29.10.24.
//

import SwiftUI

struct TrafficLightView: View {
    private let viewModel: ViewModel
    
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                    .frame(height: 20)
                HStack {
                    Text(ScreensText.TrafficLightView.title)
                    Text(viewModel.carModel)
                        .foregroundStyle(.blue)
                        .bold()
                }
                AnimatedTrafficLightView()
            }
        }
    }
}

#Preview {
    TrafficLightView(viewModel: .init(carModel: "Ford Mustang"))
}
