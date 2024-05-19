//
//  TimeView.swift
//  MovieBooking
//
//  Created by Le Anh Nguyen on 5/19/24.
//

import SwiftUI


struct TimeView: View {
    var index: Int
    var isSelected: Bool
    var onSelect: ((Int)->()) = {_ in }


    var body: some View {
        Text("\(index):00")
            .foregroundColor(isSelected ? .white : .black)
            .padding()
            .background( isSelected ? Color.accentColor : Color.gray.opacity(0.3))
            .cornerRadius(10).onTapGesture {
                self.onSelect(self.index)
        }
    }
}

//#Preview {
//    TimeView()
//}
