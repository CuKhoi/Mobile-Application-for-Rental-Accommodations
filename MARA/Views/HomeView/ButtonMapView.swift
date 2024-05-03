//
//  ButtonMapView.swift
//  MARA
//
//  Created by USER on 31/01/2024.
//

import SwiftUI

struct ButtonMapView: View {
    var body: some View {
        VStack {
            Button("Select via map") {
                // Action
            }
            .padding(.all,7)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(.blue, lineWidth: 0.5)
        )
        }
    }
}

#Preview {
    ButtonMapView()
}
