//
//  userDetails.swift
//  MovieBooking
//
//  Created by Minh Trinh on 13/5/2024.
//


import SwiftUI

//class userDetailsViewModel: ObservableObject {
    //@Published var userDetails: userDetail

  //  init() {
    //    userDetails = userDetail()
  //  }
//}

class userDetail: ObservableObject {
    @Published var username: String = ""
    @Published var password: String = ""
}



