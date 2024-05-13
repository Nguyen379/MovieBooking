//
//  bookingPage.swift
//  MovieBooking
//
//  Created by Minh Trinh on 14/5/2024.
//

import SwiftUI


struct bookingPage: View {
    @State var seatStates: [[Bool]] = Array(repeating: Array(repeating: false, count: 6), count: 5)
    @State var isButtonEnabled = false
    
    var body: some View {
        NavigationView{
            VStack {
                // Center top rectangle with text "Screen"
                ZStack {
                    Rectangle()
                        .fill(Color.gray)
                        .frame(width: 300, height: 50)
                        .overlay(Text("Screen").foregroundColor(.white))
                }
                .padding()
                // Grid of clickable rectangles for cinema seats
                VStack(spacing: 5) {
                    ForEach(0..<5, id: \.self) { row in
                        HStack(spacing: 5) {
                            ForEach(0..<6, id: \.self) { column in
                                Rectangle()
                                    .fill(seatStates[row][column] ? Color.red : Color.blue)
                                    .frame(width: 40, height: 50)
                                    .onTapGesture {
                                        seatStates[row][column].toggle()
                                        isButtonEnabled = seatStates.flatMap { $0 }.contains(true)
                                    }
                            }
                        }
                    }
                }
                
                // Button only clickable when at least one seat is selected
                
                NavigationLink(destination: myBookings()){
                    Text("Confirm seat")
                        .foregroundColor(isButtonEnabled ? Color.blue : Color.gray)
                        
                        .padding()
                }
                .disabled(!isButtonEnabled)
                .padding()
            }
        }
    }
}


#Preview {
    bookingPage()
}
