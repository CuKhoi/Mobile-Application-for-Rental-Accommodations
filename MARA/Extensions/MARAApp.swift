//
//  MARAApp.swift
//  MARA
//
//  Created by USER on 27/01/2024.
//

import FirebaseCore
import SwiftUI

@main
struct MARAApp: App {
    @State private var modelData = ModelData()
    
    init() {
        FirebaseApp.configure()
    }

    var body: some Scene {
        WindowGroup {
            MainView()
                .environment(ModelData())
        }
    }
}
