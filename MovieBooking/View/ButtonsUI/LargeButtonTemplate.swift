//
//  LargeButtonTemplate.swift
//  MovieBooking
//
//  Created by Minh Trinh on 19/5/2024.
//

import Foundation
import SwiftUI
struct LargeButtonTemplate: View {
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
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
    }
}
