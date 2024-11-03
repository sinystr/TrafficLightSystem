//
//  ContentView.swift
//  TrafficLightSystem
//
//  Created by Georgi Georgiev on 29.10.24.
//

import SwiftUI

struct SetupCarView: View {
    @Bindable private var viewModel: ViewModel
    
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                Text(ScreensText.SetupCar.title).foregroundStyle(.blue)
                Text(ScreensText.SetupCar.subtitle)
                HStack {
                    Spacer()
                    
                    TextField(ScreensText.SetupCar.textFieldPlacerholder,
                              text: $viewModel.carModel)
                    .padding(.vertical, 7)
                    .padding(.horizontal, 20)
                    .background(Capsule()
                                    .stroke(.blue, lineWidth: 1))
                    
                    driveButton
                    
                    Spacer()
                }
                .padding()
                Spacer()
            }
        }
    }
    
    var driveButton: some View {
        NavigationLink(destination: TrafficLightView(viewModel: .init(carModel: viewModel.carModel))) {
            Text(ScreensText.SetupCar.driveButtonText)
                .foregroundStyle(.white)
                .padding(.vertical, 7)
                .padding(.horizontal, 20)
                .background(Capsule()
                                .fill(viewModel.isCarModelValid ?
                                    .blue : Color(uiColor: .systemGray3)))
        }
        .disabled(!viewModel.isCarModelValid)
    }
}

#Preview {
    SetupCarView(viewModel: .init())
}
