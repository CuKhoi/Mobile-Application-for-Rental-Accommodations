//
//  House.swift
//  MARA
//
//  Created by USER on 28/01/2024.
//

import Foundation
import SwiftUI
import CoreLocation

struct House: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    
    var address: String
    var monthlyPay: String
    var score: Double
    var review: Int
    var bed: Int
    var bath: Int
    var area: Double
    var kitchen: Int
    var ac: Int
    var wifi: Int
    var pool: Int
    var parking: Int
    var elevator: Int
    var lessor: String
    var document: String
    var deposit: String
    var pet: String
    var addPolicy: String
    
    //var kitchen = falcuty![0]
    
    private var imageName: String
    var image: Image {
        Image(imageName)
    }
    
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

