//
//  DateView.swift
//  MovieBooking
//
//  Created by Le Anh Nguyen on 5/19/24.
//

import SwiftUI

struct DateView: View {
    var date: TicketDate = TicketDate(day: "03", month: "11", year: "20")
    var isSelected: Bool
    var onSelect: ((TicketDate)->()) = {_ in }
    
    
    var body: some View {
        VStack {
            Text("\(date.day)")
                .font(.title)
                .bold()
                .foregroundColor(isSelected ? .white : .black)
            
            Text("\(date.month)/\(date.year)")
                .foregroundColor(isSelected ? .white : .primary)
                .font(.callout)
                .padding(.top, 10)
            
        }.padding()
            .background( isSelected ? Color.accentColor: Color.gray.opacity(0.3))
            .clipShape(DateShape())
            .cornerRadius(10)
            .onTapGesture {
                self.onSelect(self.date)
        }
    }
}

#Preview {
    DateView(isSelected: false)
}
