//
//  ProfileView.swift
//  MARA
//
//  Created by USER on 27/01/2024.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewViewModel()
    @StateObject var viewModelMain = MainViewViewModel()
    
    var body: some View {
        VStack {
            //  Header
            VStack {
                Image(systemName : "person.circle.fill")
                    .resizable ()
                    .frame(width:80, height : 80)
                    .foregroundColor(Color(.systemGray4))
                Text ("Bruce Wayne")
                    .font(.title2)
                    .fontWeight(.semibold)
            }
            
            //  List
            List {
                Section {
                    ForEach(SettingsOptionsViewModel.allCases) { option in
                        HStack {
                            Image(systemName: option.imageName)
                                .resizable ()
                                .frame(width: 24, height : 24)
                                .foregroundColor(option.imageBackgroundColor)
                            Text(option.title)
                                .font(.subheadline)
                        }

                    }
                             
                }
                Section {
                    Button("Log out") {
                        viewModelMain.currentUserId = ""
                        viewModel.logOut()
                    }
                    Button("Delete Account") {
                        // Action
                    }
                }
                .foregroundColor(.red)
            }
        }
    }
}


#Preview {
    ProfileView()
        //.environment(ModelData())
}
