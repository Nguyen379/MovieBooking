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
                
                HStack{
                    ZStack{
                        Rectangle()
                            .fill(Color.red)
                            .frame(width: 100, height: 100)
                        
                        NavigationLink(
                            destination: movieDescription()) {
                                Text("Movie 1")
                                    .foregroundColor(.white)
                            }
                        
                        
                    }
                    .offset(y: 200)
                    ZStack{
                        Rectangle()
                            .fill(Color.red)
                            .frame(width: 100, height: 100)
                        NavigationLink(
                            destination: homePage()) {
                                VStack{
                                    Text("Movie 2")
                                        .foregroundColor(.white)
                                    Text("(Unavailabe)")
                                        .foregroundColor(.white)
                                }
                            }
                            }
                            .offset(y: 200)
                    }
                }
            }
        }
    }



#Preview {
    homePage()
}
