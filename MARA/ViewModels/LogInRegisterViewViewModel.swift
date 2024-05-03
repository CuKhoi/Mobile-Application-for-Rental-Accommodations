//
//  RegisterViewViewModel.swift
//  MARA
//
//  Created by USER on 31/01/2024.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth

class LogInRegisterViewViewModel: ObservableObject {
    @Published var name = ""
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    init() {}
    
    // Register
    func register() {
        guard validateRegister() else {
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password){[weak self] result, error in
            guard let userID = result?.user.uid else {
                return
            }
            self?.insertUserRecord(id: userID)
        }
    }
    
    // Log In
    func login(){
        guard validateLogIn() else {
            return
        }
        
        ///Try log in
        Auth.auth().signIn(withEmail: email, password: password)
    }
    
    
    private func insertUserRecord(id: String){
        ///Create model
        let newUser = User(id: id,
                           name: name,
                           email: email,
                           joined: Date().timeIntervalSince1970)
        
        ///Save model
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(id)
            .setData(newUser.asDictionary())
        
    }
    
    
    private func validateRegister () -> Bool{
        ///Check if blank or only whitespacing
        guard !name.trimmingCharacters(in: .whitespaces).isEmpty,!email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        
        ///Check if email is valid (contain @ and .)
        guard email.contains("@") && email.contains(".") else {
            return false
        }
        
        ///Check number of password characters
        guard password.count >= 6 else {
            return false
        }
        
        return true
    }
    
    func validateLogIn() -> Bool{
        errorMessage = ""
        ///Check if blank or only whitespacing
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage = "Please fill in all fields."
            return false
        }
        
        ///Check if email is valid (contain @ and .)
        guard email.contains("@") && email.contains(".") else {
            errorMessage = "Please enter valid email."
            return false
        }
        
        return true
    }
    
}
