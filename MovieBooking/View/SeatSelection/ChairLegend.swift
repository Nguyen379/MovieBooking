//
//  ChairLegend.swift
//  MovieBooking
//
//  Created by Le Anh Nguyen on 5/19/24.
//

import SwiftUI
struct ChairLegend: View {
    var text = "Selected"
    var color: Color = .gray
    
    var body: some View {
        HStack{
             ChairView(width: 20,accentColor: color, isSelectable: false)
            Text(text).font(.subheadline).foregroundColor(color)
        }.frame(maxWidth: .infinity)
    }
}

#Preview {
    ChairLegend()
}
