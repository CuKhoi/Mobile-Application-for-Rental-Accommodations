//
//  LogInRegisterView.swift
//  MARA
//
//  Created by USER on 31/01/2024.
//

import SwiftUI
import Firebase

struct LogInRegisterView: View {
    @StateObject var viewModel = LogInRegisterViewViewModel()
    
    @State var isLoginMode = false
    /*
    @State var email = ""
    @State var name = ""
    @State var password = ""
     */
    
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 16) {
                    Picker(selection: $isLoginMode, label: Text("Picker here")) {
                        Text("Login")
                            .tag(true)
                        Text("Create Account")
                            .tag(false)
                    }.pickerStyle(SegmentedPickerStyle())
                        
                    if !isLoginMode {
                        Button {
                            // Action
                        } label: {
                            Image(systemName: "person.fill")
                                .font(.system(size: 64))
                                .padding()
                        }
                        TextField("Full name", text: $viewModel.name)
                            .autocapitalization(.none)
                            .padding(12)
                            .background(Color.white)
                    }
                    
                    Group {
                        TextField("Email", text: $viewModel.email)
                            .keyboardType(.emailAddress)
                            .autocapitalization(.none)
                            .autocorrectionDisabled()
                        SecureField("Password", text: $viewModel.password)
                    }
                    .padding(12)
                    .background(Color.white)
                    
                    Button {
                        handleAction()
                    } label: {
                        HStack {
                            Spacer()
                            Text(isLoginMode ? "Log In" : "Create Account")
                                .foregroundColor(.white)
                                .padding(.vertical, 10)
                                .font(.system(size: 14, weight: .semibold))
                            Spacer()
                        }.background(Color.blue)
                        
                    }
                }
                .padding()
                
            }
            .navigationTitle(isLoginMode ? "Log In" : "Create Account")
            .background(Color(.init(white: 0, alpha: 0.05))
                            .ignoresSafeArea())
        }
    }
    
    private func handleAction() {
        if isLoginMode {
            viewModel.login()
            print("Should log into Firebase with existing credentials")
        } else {
            viewModel.register()
            print("Register a new account inside of Firebase Auth and then store image in Storage somehow....")
        }
    }
    
    /*private func createNewAccount() {
        Auth.auth().createUser(withEmail: email, password: password) {
            result, err invalidatableContent(
                if let err = err {
                    print("Fail to create user:", err)
                    return
                }
                print("Successfully created user: \(result?.user.uid ??"")")
        }
    }*/
}

#Preview {
    LogInRegisterView()
}
