//
//  HouseListingView.swift
//  MARA
//
//  Created by USER on 27/01/2024.
//

import SwiftUI

struct HouseListingView: View {
    //var house: House
    var house: House
    
    var body: some View {
        VStack(alignment: .leading){
            VStack(alignment: .leading) {
                house.image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    //.frame(width: 340)
                    //.fixedSize()
                //Spacer()
            }
            VStack(alignment: .leading) {
                HStack {
                    Text(house.name)
                        .font(.title2)
                        .fontWeight(.bold)
                    Spacer()
                    Text("\(house.monthlyPay) vnd")
                        .font(.caption)
                        .multilineTextAlignment(.trailing)
                        .offset(x:-10)
                }
                .frame(maxWidth: .infinity, alignment:.leading)
                .padding(.bottom, 1)
                //.padding(.leading, 10)
                HStack {
                    Image(systemName: "mappin")
                    HStack {
                        Text(house.address)
                            .font(.caption2)
                            .fixedSize(horizontal: true, vertical: false)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.bottom, 1)
                .offset(x:-5)
                //.padding(.leading, 10)
                HStack {
                    Text("\(String(house.bed)) Bedrooms - \(String(house.bath)) Bathrooms - \(String(house.area)) m\u{00B2} Area")
                        .font(.footnote)
                }
            }
            //.layoutPriority(1)
            //.frame(width: 340)
            .cornerRadius(5)
            //.padding(.vertical)
            //.padding(.horizontal)
            /*.background(
                Color.gray
                        .opacity(0.2)
            )*/
        }
        .offset(x:10)
        //.frame(width: 400)
    }
}

#Preview {
    let houses = ModelData().houses
    return Group{
        HouseListingView(house: houses[0])
        HouseListingView(house: houses[1])
    }
    //HouseListingView(house: houses[0])
}
