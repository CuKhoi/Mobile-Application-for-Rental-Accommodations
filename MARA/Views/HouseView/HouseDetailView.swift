//
//  HouseDetailView.swift
//  MARA
//
//  Created by USER on 28/01/2024.
//

import SwiftUI

struct HouseDetailView: View {
    @Environment(ModelData.self) var modelData
    //@StateObject var viewModel: HouseDetailViewViewModel
    @Binding var mapViewPresented: Bool
    
    var house: House
    
    /*init(house: House){
        self._viewModel = StateObject(wrappedValue:  HouseDetailViewViewModel())
        self.house = house
        self._mapViewPresented = Binding(false)
    }*/
    
    var body: some View {
        Form{
            VStack(alignment: .leading) {
                HStack {
                    Text(house.name)
                        .font(.title)
                        .fontWeight(.heavy)
                        .multilineTextAlignment(.leading)
                    Spacer()
                    Text("\(house.monthlyPay) vnd / month")
                        .multilineTextAlignment(.trailing)
                }
                Text(house.lessor)
                    .fontWeight(.light)
                    .padding(.bottom,5)
                HStack {
                    HStack(alignment: .top) {
                        Image(systemName: "mappin")
                        Text(house.address)
                            .font(.caption)
                            .fontWeight(.light)
                            .multilineTextAlignment(.leading)
                            .onTapGesture {
                                mapViewPresented = true
                            }
                    }
                    Spacer()
                    Image(systemName: "star.fill")
                        .foregroundStyle(.yellow)
                    Text("\(String(house.score)) (\(house.review))")
                }
                .padding(.bottom, 10)
                Divider()
                // Description and Facilities
                DescriptionFacilityPolicyView(house: house)
            }
            
        }
        .accentColor(.black)    ///for prevent text and icons turns blue after return from navigationlink view
        .toolbar {
            ToolbarItemGroup(placement: .bottomBar) {
                HStack {
                    Button(action: {
                        // Action
                    }, label: {
                        Image(systemName: "message")
                            .resizable()
                            .frame(width: 30, height: 30)
                    })
                    .padding(.all,7)
                    .padding(.leading, 10)
                    Spacer()
                    Button("Booking") {
                        // Action
                    }
                    .frame(alignment: .bottom)
                    .padding(.all,7)
                    .padding(.horizontal, 90)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.blue, lineWidth: 0.5)
                    )
                }
                .padding()
                .frame(width: 360)
                .frame(alignment: .bottom)
                .foregroundStyle(LinearGradient(colors: [.blue, .indigo], startPoint: .top, endPoint: .bottom))
                .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 12, style: .continuous))
                .edgesIgnoringSafeArea(.bottom)
            }
        }
        .toolbarBackground(.hidden, for: .bottomBar)
    }
        
}

#Preview {
    let modelData = ModelData()
    return HouseDetailView(mapViewPresented: Binding(get: {
        return false
    }, set: { _ in
        
    }), house: modelData.houses[1])
        .environment(ModelData())
}
