//
//  ContentView.swift
//  MovieBooking
//
//  Created by Le Anh Nguyen on 5/12/24.
//

import SwiftUI

struct ContentView: View {
    @State var currentTab: Tab = .location

    init() {
        UITabBar.appearance().isHidden = true
    }

    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                TabView(selection: $currentTab) {

                    MapContentView()
                        .tag(Tab.location)

                    TicketView()
                        .tag(Tab.ticket)

                    loginPage()
                        .tag(Tab.profile)
                }

                CustomTabBar(currentTab: $currentTab)
            }
            .ignoresSafeArea(.keyboard)
        }
    }
}

#Preview {
    ContentView()
}
