//
//  loginPage.swift
//  MovieBooking
//
//  Created by Minh Trinh on 12/5/2024.
//

import SwiftUI
import CoreData

struct loginPage: View {
    @Environment(\.managedObjectContext) private var viewContext
    @StateObject private var userDetails = userDetail(context: PersistenceController.shared.container.viewContext)
    
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isLoginSuccessful: Bool = false
    @State private var errorMessage: String?
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                
                Text("Login Form")
                    .font(.title)
                    .padding()
                
                TextField("Email", text: $email)
                    .autocapitalization(.none)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.purple, lineWidth: 2)
                    )
                    .textFieldStyle(PlainTextFieldStyle())
                
                SecureField("Password", text: $password)
                    .textContentType(.none) 
                    .autocapitalization(.none)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.purple, lineWidth: 2)
                    )
                    .textFieldStyle(PlainTextFieldStyle())
                
                if let errorMessage = errorMessage {
                    Text(errorMessage)
                        .foregroundColor(.red)
                        .padding(.horizontal, 20)
                }
                
                Button(action: validate){
                    Text("Login")
                        .font(.body) // Adjust font size to match LargeButton
                        .fontWeight(.medium) // Adjust font weight to match LargeButton
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, maxHeight: 60)
                        .background(LinearGradient(colors: [Color("majenta"), Color("purple")], startPoint: .topLeading, endPoint: .bottomTrailing))
                        .cornerRadius(20)
                        .overlay {
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(LinearGradient(colors: [Color("pink"), Color("pink").opacity(0), Color("pink").opacity(0)], startPoint: .topLeading, endPoint: .bottomTrailing), style: StrokeStyle(lineWidth: 2))
                                .frame(maxWidth: .infinity, maxHeight: 58)
                        }
                        .padding([.horizontal, .bottom], 20)
                }
                .disabled(email.isEmpty || password.isEmpty)
                .simultaneousGesture(TapGesture().onEnded {
                                    validate()
                                })
                .padding()
                
                
                HStack {
                    Text("Don't have an account?")
                    NavigationLink(destination: signUp().navigationBarBackButtonHidden(true)) {
                        Text("Sign up")
                            .foregroundColor(.blue)
                    }
                }
                .padding()
                
                Spacer()
            }
            .padding()
            .background(NavigationLink(destination: homePage().navigationBarBackButtonHidden(true), isActive: $isLoginSuccessful) { EmptyView() })
        }
    }
    
    private func validate() {
        guard !email.isEmpty, !password.isEmpty else {
            errorMessage = "Email and password are required."
            isLoginSuccessful = false
            return
        }
        
        if userDetails.fetchUser(email: email, password: password) {
            errorMessage = nil
            userDetails.email = email
            userDetails.password = password
            
            isLoginSuccessful = true
        } else {
            errorMessage = "Invalid email or password."
            isLoginSuccessful = false
        }
    }
}

#Preview {
    loginPage()
}
