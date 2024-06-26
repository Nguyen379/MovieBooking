//
//  userDetails.swift
//  MovieBooking
//
//  Created by Minh Trinh on 13/5/2024.
//


import SwiftUI
import CoreData


class userDetail: ObservableObject {
    @Published var username: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    
    private var viewContext: NSManagedObjectContext
    
    init(context: NSManagedObjectContext) {
        self.viewContext = context
    }
    
    func saveUserDetails() -> Bool {
        let newUser = User(context: viewContext)
        newUser.username = username
        newUser.email = email
        newUser.password = password
        
        do {
            try viewContext.save()
            return true
        } catch {
            print("Failed to save user: \(error)")
            return false
        }
    }

    func getUserDetails(email: String, password: String) -> (String, String, String)? {
            let fetchRequest: NSFetchRequest<User> = User.fetchRequest()
            fetchRequest.predicate = NSPredicate(format: "email == %@ AND password == %@", email, password)
            
            do {
                let result = try viewContext.fetch(fetchRequest)
                if let user = result.first {
                    if let username = user.username, let email = user.email, let password = user.password {
                        return (username, email, password)
                    }
                }
            } catch {
                print("Failed to fetch user: \(error)")
            }
            return nil
        }

    func fetchUser(email: String, password: String) -> Bool{
        let fetchRequest: NSFetchRequest<User> = User.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "email == %@ AND password == %@", email, password)
        
        do {
            let result = try viewContext.fetch(fetchRequest)
            if let user = result.first {
                self.username = user.username ?? ""
                self.email = user.email ?? ""
                self.password = user.password ?? ""
                return true
            }
        } catch {
            print("Failed to fetch user: \(error)")
        }
       return false
    }
  //  func displayUser() -> some View {
     //  fetchUserByEmail(email: email)
     //   return VStack{
      //      Label("Username: \(self.username)", systemImage: "person.fill")
       //     Label("Email: \(self.email)", systemImage: "envelope.fill")
       //     Label("Password: \(self.password)", systemImage: "lock.fill")      //  }
  //  }

func modifyUser(email: String, newUsername: String?, newEmail: String?, newPassword: String?) -> Bool {
        let fetchRequest: NSFetchRequest<User> = User.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "email == %@", email)
        
        do {
            let result = try viewContext.fetch(fetchRequest)
            if let user = result.first {
                if let newUsername = newUsername {
                    user.username = newUsername
                }
                if let newEmail = newEmail {
                    user.email = newEmail
                }
                if let newPassword = newPassword {
                    user.password = newPassword
                }
                try viewContext.save()
                return true
            }
        } catch {
            print("Failed to modify user: \(error)")
        }
        return false
    }
func deleteUser(email: String) -> Bool {
        let fetchRequest: NSFetchRequest<User> = User.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "email == %@", email)
        
        do {
            let result = try viewContext.fetch(fetchRequest)
            if let user = result.first {
                viewContext.delete(user)
                try viewContext.save()
                return true
            }
        } catch {
            print("Failed to delete user: \(error)")
        }
        return false
    }


}




