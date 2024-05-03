//
//  HomeView.swift
//  MARA
//
//  Created by USER on 27/01/2024.
//

import SwiftUI

enum SearchScope: String, CaseIterable {
    case inbox, favorites
}

struct HomeView: View {
    
    @Environment(ModelData.self) var modelData
    //@StateObject var viewModel: HomeViewViewModel
    var houses: [House] {
        modelData.houses
    }
    
    @State private var searchText = ""
    @State private var searchScope = SearchScope.inbox
    
    //  Change font of NavigationTitle
    init() {
        //Use this if NavigationBarTitle is with Large Font
        UINavigationBar.appearance().largeTitleTextAttributes = [.font : UIFont(name: "Georgia-Bold", size: 20)!, .foregroundColor: UIColor.gray]

        //Use this if NavigationBarTitle is with displayMode = .inline
        UINavigationBar.appearance().titleTextAttributes = [.font : UIFont(name: "Georgia-Bold", size: 15)!, .foregroundColor: UIColor.gray]
    }
    
    var body: some View {
        NavigationView {
            List{
                if (searchText.isEmpty==false) {
                    NavigationLink{
                        MapView()
                    } label: {
                        ButtonMapView()
                    }
                }
                ForEach(searchHouse) { house in
                    NavigationLink{
                        HouseView(house: house)
                    } label: {
                        HouseListingView(house: house)
                    }
                    .listRowSeparator(.hidden)
                    .padding(.bottom, 10)
                    Divider()
                }
            }
            .scrollContentBackground(.hidden)
            .navigationTitle("Find your Perfect home!")
            .toolbar {
                Button("Add", systemImage: "plus") {
                    // Action
                }
                Button("Filter", systemImage: "slider.vertical.3") {
                    // Action
                }
            }
        }
        .searchable(text: $searchText)
    }
    var searchHouse: [House] {
        if searchText.isEmpty {
            return houses
        }
        else {
            return houses.filter{ $0.name.localizedCaseInsensitiveContains(searchText) || $0.address.localizedCaseInsensitiveContains(searchText) }
        }
    }
}


#Preview {
    HomeView()
        .environment(ModelData())
}
