//
//  NearbyLocation.swift
//  MARA
//
//  Created by USER on 28/01/2024.
//

import Foundation
import CoreLocation
import SwiftUI

struct NearbyLocation: Hashable, Codable, Identifiable  {
    var id: Int
    var name: String
    var type: String
    
    private var coordinates: Coordinates
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude)
    }
    
    struct Coordinates: Hashable, Codable {
        var latitude: Double
        var longitude: Double
    }
}
