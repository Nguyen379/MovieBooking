//
//  DateTimeView.swift
//  MovieBooking
//
//  Created by Le Anh Nguyen on 5/19/24.
//
import SwiftUI

struct DateTimeView: View {

    @State private var selectedDate: TicketDate = TicketDate.default
    @State private var selectedHourndex: Int = -1
    private let dates = Date.getFollowingThirtyDays()

    @Binding var date: TicketDate
    @Binding var hour: String

    var body: some View {
        VStack(alignment: .leading, spacing: 30) {
            createDateView()
            createTimeView()
        }    }

    fileprivate func createDateView() -> some View{
        VStack(alignment: .leading) {
            Text("Date")
                .font(.headline).padding(.leading)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack{
                    ForEach(dates, id: \.day){ date in
                        DateView(date: date, isSelected: self.selectedDate.day == date.day, onSelect: { selectedDate in
                            self.selectedDate = selectedDate
                            self.date = selectedDate
                        })
                    }
                }.padding(.horizontal)
            }
        }
    }

    fileprivate func createTimeView() -> some View {

        VStack(alignment: .leading) {
            Text("Time").font(.headline).padding(.leading)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack{
                    ForEach(0..<24, id: \.self){ i in
                        TimeView(index: i, isSelected: self.selectedHourndex == i, onSelect: { selectedIndex in
                            self.selectedHourndex = selectedIndex
                            self.hour = "\(selectedIndex):00"
                        })
                    }
                }.padding(.horizontal)
            }
        }
    }

}

#Preview {
    DateTimeView(date: .constant(TicketDate.default), hour: .constant(""))
}