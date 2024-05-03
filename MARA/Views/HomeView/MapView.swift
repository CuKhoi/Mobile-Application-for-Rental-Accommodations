//
//  MapView.swift
//  MARA
//
//  Created by USER on 30/01/2024.
//

import SwiftUI
import MapKit

struct MapView: View {
    @Environment(ModelData.self) var modelData
    var nearbyLocations: [NearbyLocation] {
        modelData.nearbyLocations
    }
    var houses: [House] {
        modelData.houses
    }
    
    private var currentLocation = CLLocationCoordinate2D(latitude: 10.877945735631423, longitude: 106.80160858966453)
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 10.877945735631423, longitude: 106.80160858966453), span: MKCoordinateSpan(latitudeDelta: 0.0095, longitudeDelta: 0.0095))
    
    var body: some View {
        NavigationView {
            VStack {
                VStack {
                    Map (coordinateRegion: $region, annotationItems: houses){ house in
                        MapAnnotation(coordinate: house.locationCoordinate) {
                          NavigationLink {
                            HouseView(house: house)
                          } label: {
                            PlaceAnnotationView(title: house.name)
                          }
                        }
                        //Marker("Current Location", systemImage: "location", coordinate: currentLocation)
                        /*ForEach(houses) { house in
                            //Marker(house.name, systemImage: "house", coordinate: house.locationCoordinate)
                            /*Annotation(house.name, coordinate: house.locationCoordinate) {
                                Image(systemName: "house.fill")
                                    .resizable()
                                    .frame(width: 20, height: 20)
                                    .foregroundColor(.blue)
                            }*/
                            MapAnnotation(coordinate: house.locationCoordinate) {
                              NavigationLink {
                                HouseView(house: house)
                              } label: {
                                PlaceAnnotationView(title: house.name)
                              }
                            }
                            
                        }*/
                        /*
                        ForEach(nearbyLocations) { nearbylocation in
                            Annotation(nearbylocation.name, coordinate: nearbylocation.locationCoordinate) {
                                Image(systemName: "graduationcap")
                                    .resizable()
                                    .frame(width: 20, height: 20)
                                    .foregroundColor(.orange)
                            }
                        }
                         */
                    }
                    /*Map (coordinateRegion: $region, annotationItems: nearbyLocations){ near in
                        MapAnnotation(coordinate: near.locationCoordinate) {
                            PlaceAnnotationView(title: near.name)
                        }
                    }*/
                }
            }
        }
        .toolbar(.hidden, for: .tabBar)
        .edgesIgnoringSafeArea(.all)
    }
    /*
    private var region: MKCoordinateRegion {
            MKCoordinateRegion(
                center: currentLocation,
                span: MKCoordinateSpan(latitudeDelta: 0.0095, longitudeDelta: 0.0095)
            )
    }*/
}

#Preview {
    /*MapView(currentLocation: CLLocationCoordinate2D(latitude: 10.877945735631423, longitude: 106.80160858966453))
        .environment(ModelData())*/
    MapView()
        .environment(ModelData())
}
