//	
//  ContentView.swift	
//  MovieBooking	
//	
//  Created by Le Anh Nguyen on 5/12/24.	
//	

import SwiftUI	

struct ContentView: View {	
    @State var currentTab: Tab = .home	

    init() {	
        UITabBar.appearance().isHidden = true	
    }	

    var body: some View {	
        NavigationView {	
            VStack(spacing: 0) {	
                TabView(selection: $currentTab) {	
                    HomeView()	
                        .tag(Tab.home)	

                    MapContentView()	
                        .tag(Tab.location)	

                    TicketView()	
                        .tag(Tab.ticket)	

                    Text("Category")	
                        .tag(Tab.category)	

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