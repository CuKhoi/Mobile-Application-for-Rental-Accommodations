//
//  PlaceAnnotationView.swift
//  MARA
//
//  Created by USER on 31/01/2024.
//

import SwiftUI

struct PlaceAnnotationView: View {
    let title: String
    
    var body: some View {
        VStack(spacing: 0) {
              Text(title)
                .font(.callout)
                .padding(5)
                .background(Color(.white))
                .cornerRadius(10)
              
              Image(systemName: "house.circle.fill")
                .font(.title)
                .foregroundColor(.green)
              
              Image(systemName: "arrowtriangle.down.fill")
                .font(.caption)
                .foregroundColor(.green)
                .offset(x: 0, y: -5)
            }
    }
}

#Preview {
    PlaceAnnotationView(title: "test")
}
