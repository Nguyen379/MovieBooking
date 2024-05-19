//
//  LCButton.swift
//  MovieBooking
//
//  Created by Le Anh Nguyen on 5/20/24.
//

import SwiftUI

struct LCButton: View {
    var text = "Buy Tickets"
    var action = {}
    
    var body: some View {
        Button(action: {
            self.action()
        }) {
            HStack {
                Text(text)
                    .font(.system(size: 20, weight: Font.Weight.semibold))
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding(.vertical)
                    .accentColor(Color.white)
                    .background(LinearGradient(gradient: Gradient(colors: [Color.accentColor, .purple]) , startPoint: .leading, endPoint: .trailing))
                    .cornerRadius(10)
            }
        }.padding(.vertical)
    }
}

#Preview {
    LCButton()
}
