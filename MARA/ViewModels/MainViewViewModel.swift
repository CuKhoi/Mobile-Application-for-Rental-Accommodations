//
//  MainViewViewModel.swift
//  MARA
//
//  Created by USER on 31/01/2024.
//

import Foundation
import FirebaseAuth

class MainViewViewModel: ObservableObject {
    // Observe from Firebase when currentUser changes
    // @Published will be triggered when user log in or out
    // => Update View
    @Published var currentUserId: String = ""
    private var handler: AuthStateDidChangeListenerHandle?
    
    init() {
        self.handler = Auth.auth().addStateDidChangeListener { [weak self] _, user in
            DispatchQueue.main.async {
                self?.currentUserId = user?.uid ?? ""
            }
        }
    }
    
    public var isSignedIn: Bool {
        // If there is a value of currentUser => signed in
        return Auth.auth().currentUser != nil
    }
}
