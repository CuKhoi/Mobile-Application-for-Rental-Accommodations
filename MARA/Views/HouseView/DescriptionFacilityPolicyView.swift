//
//  DescriptionFacilityPolicyView.swift
//  MARA
//
//  Created by USER on 28/01/2024.
//

import SwiftUI

struct DescriptionFacilityPolicyView: View {
    @Environment(ModelData.self) var modelData
    var house: House
    
    var body: some View {
        //  Description
        VStack(alignment: .leading) {
            Text("Description")
                .font(.title)
                .fontWeight(.bold)
                .padding(.bottom, 10)
            HStack(alignment: .center) {
                HStack {
                    Image(systemName: "bed.double")
                        .frame(width: 4, height: 4)
                        .padding()
                        .border(.black)
                    VStack(alignment:.leading) {
                        Text("Bedroom")
                            .font(.caption)
                        Text("\(house.bed) rooms")
                            .font(.caption)
                            .fontWeight(.light)
                    }
                }
                Spacer()
                HStack {
                    Image(systemName: "bathtub")
                        .frame(width: 4, height: 4)
                        .padding()
                        .border(.black)
                    VStack(alignment:.leading) {
                        Text("Bathroom")
                            .font(.caption)
                        Text("\(house.bath) rooms")
                            .font(.caption)
                            .fontWeight(.light)
                    }
                }
                Spacer()
                HStack {
                    Image(systemName: "diamond")
                        .frame(width: 4, height: 4)
                        .padding()
                        .border(.black)
                    VStack(alignment:.leading) {
                        Text("Area")
                            .font(.caption)
                        Text("\(String(house.area)) m\u{00B2}")
                            .font(.caption)
                            .fontWeight(.light)
                    }
                }
            }
            .padding(.bottom, 30)
            //  Facilities
            Text("Facilities")
                .font(.title)
                .fontWeight(.bold)
                .padding(.bottom, 10)
            HStack(alignment: .center) {
                if (house.kitchen != 0) {
                    VStack(alignment: .center) {
                        Image(systemName: "fork.knife")
                            .frame(width: 4, height: 4)
                            .padding()
                            .border(.black)
                        Text("Kitchen")
                            .font(.caption)
                    }
                    Spacer()
                }
                if (house.ac != 0) {
                    VStack(alignment: .center) {
                        Image(systemName: "air.conditioner.horizontal")
                            .frame(width: 4, height: 4)
                            .padding()
                            .border(.black)
                        Text("AC")
                            .font(.caption)
                    }
                    Spacer()
                }
                if (house.wifi != 0) {
                    VStack(alignment: .center) {
                        Image(systemName: "wifi")
                            .frame(width: 4, height: 4)
                            .padding()
                            .border(.black)
                        Text("Wifi")
                            .font(.caption)
                    }
                    Spacer()
                }
                if (house.parking != 0) {
                    VStack(alignment: .center) {
                        Image(systemName: "parkingsign")
                            .frame(width: 4, height: 4)
                            .padding()
                            .border(.black)
                        Text("Parking")
                            .font(.caption)
                    }
                    Spacer()
                }
                if (house.pool != 0) {
                    VStack(alignment: .center) {
                        Image(systemName: "figure.pool.swim")
                            .frame(width: 4, height: 4)
                            .padding()
                            .border(.black)
                        Text("Swimming Pool")
                            .font(.caption)
                    }
                    Spacer()
                }
                if (house.elevator != 0) {
                    VStack(alignment: .center) {
                        Image(systemName: "door.sliding.right.hand.closed")
                            .frame(width: 4, height: 4)
                            .padding()
                            .border(.black)
                        Text("Elevator")
                            .font(.caption)
                    }
                    Spacer()
                }
            }
            .padding(.bottom, 30)
            Divider()
            // Policy
            Text("Policy")
                .font(.title)
                .fontWeight(.bold)
                .padding(.bottom, 10)
            VStack(alignment: .leading) {
                HStack(alignment: .top) {
                    Image(systemName: "doc.text")
                    VStack(alignment:.leading) {
                        Text("Required Documents")
                            .font(.headline)
                        Text(house.document)
                            .font(.caption)
                            //.fixedSize(horizontal: false, vertical: true)
                            .multilineTextAlignment(.leading)
                    }
                }
                .padding(.bottom, 10)
                HStack(alignment: .top) {
                    Image(systemName: "dollarsign")
                    VStack(alignment:.leading) {
                        Text("Deposit")
                            .font(.headline)
                        Text(house.deposit)
                            .font(.caption)
                            //.fixedSize(horizontal: false, vertical: true)
                            .multilineTextAlignment(.leading)
                    }
                }
                .padding(.bottom, 10)
                HStack(alignment: .top) {
                    Image(systemName: "pawprint.fill")
                    VStack(alignment:.leading) {
                        Text("Pets")
                            .font(.headline)
                        Text(house.pet)
                            .font(.caption)
                            //.fixedSize(horizontal: false, vertical: true)
                            .multilineTextAlignment(.leading)
                    }
                }
                .padding(.bottom, 10)
                HStack(alignment: .top) {
                    Image(systemName: "doc.on.doc")
                    VStack(alignment:.leading) {
                        Text("Additional Policy")
                            .font(.headline)
                        Text(house.addPolicy)
                            .font(.caption)
                            //.fixedSize(horizontal: false, vertical: true)
                            .multilineTextAlignment(.leading)
                    }
                }
                .padding(.bottom, 10)
            }
        }
        
    }
}

#Preview {
    let modelData = ModelData()
    return DescriptionFacilityPolicyView(house: modelData.houses[1])
        .environment(ModelData())
}
