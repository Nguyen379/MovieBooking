//
//  movieDescription.swift
//  MovieBooking
//
//  Created by Minh Trinh on 14/5/2024.
//

import SwiftUI

struct movieDescription: View {
    var body: some View {
        NavigationView{
            VStack{
                Text("Movie length, image, rating, ...")
                    .padding()
                NavigationLink(destination: bookingPage()){
                    Text("Book now")
                }
            }
            .navigationBarTitle("Movie description", displayMode: .inline)
        }
    }
}

#Preview {
    movieDescription()
}
