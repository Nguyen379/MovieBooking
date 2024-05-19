//
//  homePage.swift
//  MovieBooking
//
//  Created by Minh Trinh on 12/5/2024.
//

import SwiftUI


struct homePage: View {
    
    
    var body: some View {
        NavigationView {
            VStack {
                ZStack{
                    Circle()
                        .fill(Color.blue)
                        .frame(width: 100, height: 100)
                    
                    NavigationLink(
                        destination: userProfile().navigationBarBackButtonHidden(true)) {
                            Text("User Profile")
                                .foregroundColor(.white)
                            
                        }
                }
                .offset(y: 50)
                
                
                }
            }
        }
    }



#Preview {
    homePage()
}
