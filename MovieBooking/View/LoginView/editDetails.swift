//
//  editDetails.swift
//  MovieBooking
//
//  Created by Minh Trinh on 13/5/2024.
//

// ViewUserDetailPage.swift
import SwiftUI
import CoreData

struct editDetails1: View {
    @State private var email: String = ""
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var isShowingAlert = false
    @Environment(\.managedObjectContext) private var viewContext
    @StateObject private var userDetails = userDetail(context: PersistenceController.shared.container.viewContext)
    var body: some View {
        VStack {
            TextField("Enter email", text: $email)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
            TextField("Enter email", text: $password)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Button("Search") {
                fetchUserDetails()
            }
            .padding()
            Spacer()
            VStack(alignment: .leading){
                Text("Username:\(username)")
                Text("Email:\(password)")
                Text("Password:\(password)")
                
            }
            .padding()
            Spacer()
            .alert(isPresented: $isShowingAlert) {
                Alert(title: Text("User Details"), message: Text("Username: \(username)\nEmail: \(email)\nPassword: \(password)"), dismissButton: .default(Text("OK")))
            }
            
            Spacer()
        }
        .padding()
    }
    
    func fetchUserDetails() {
        if userDetails.fetchUser(email: email, password: password){
            username = userDetails.username
            email = userDetails.email
            password = userDetails.password
            isShowingAlert = true
        } else {
            print("Error")
        }
    }
}



















//#Preview {
 //   editDetails1()
//}
