//
//  HouseMapsView.swift
//  MARA
//
//  Created by USER on 27/01/2024.
//

import SwiftUI
import MapKit

struct HouseMapsView: View {
    
    @Environment(ModelData.self) var modelData
    var nearbyLocations: [NearbyLocation] {
        modelData.nearbyLocations
    }
    
    var houseName: String
    var houseLocation: CLLocationCoordinate2D
    
    var body: some View {
        VStack {
            VStack {
                Map (position: .constant(.region(region))){
                    Marker(houseName, systemImage: "house", coordinate: houseLocation)
                    ForEach(nearbyLocations) { nearbylocation in
                        Annotation(nearbylocation.name, coordinate: nearbylocation.locationCoordinate) {
                            Image(systemName: "graduationcap")
                                .resizable()
                                .frame(width: 20, height: 20)
                                .foregroundColor(.blue)
                        }
                    }
                }
            }
        }
    }
    private var region: MKCoordinateRegion {
            MKCoordinateRegion(
                center: houseLocation,
                span: MKCoordinateSpan(latitudeDelta: 0.0095, longitudeDelta: 0.0095)
            )
    }
}

#Preview {
    HouseMapsView(houseName: "E TOWN Tan Binh", houseLocation: CLLocationCoordinate2D(latitude: 10.801916356927123, longitude: 106.64513798408643))
        .environment(ModelData())
}
