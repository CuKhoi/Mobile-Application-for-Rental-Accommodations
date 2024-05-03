//
//  HouseView.swift
//  MARA
//
//  Created by USER on 27/01/2024.
//

import SwiftUI

struct HouseView: View {
    @Environment(ModelData.self) var modelData
    @StateObject var viewModel: HouseViewViewModel
    var house: House
    
    init(house: House){
        self._viewModel = StateObject(wrappedValue:  HouseViewViewModel())
        self.house = house
    }
    
    var body: some View {
    @Bindable var modelData = modelData
        GeometryReader { proxy in
            VStack {
                house.image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: proxy.size.width, alignment: .topLeading)
                    .edgesIgnoringSafeArea(.top)
                Spacer()
            }
        }
            .sheet(isPresented: $viewModel.showingHouseDetail) {
                NavigationView {
                    NavigationLink {
                        HouseMapsView(houseName: house.name, houseLocation: house.locationCoordinate)
                    } label: {
                        HStack() {
                            HouseDetailView(mapViewPresented: $viewModel.showMapView, house: house)
                        }
                    }
                }
                .presentationDetents([.fraction(0.75)])
                .presentationContentInteraction(.resizes)
                .interactiveDismissDisabled()
                .presentationBackgroundInteraction(.enabled(upThrough: .fraction(0.75)))
            }
        
        //.navigationTitle(house.name)
        //.navigationBarTitleDisplayMode(.large)
    }

}

#Preview {
    let modelData = ModelData()
    return HouseView(house: modelData.houses[1])
        .environment(ModelData())
}
