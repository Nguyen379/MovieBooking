//
//  HomeView.swift
//  MovieBooking
//
//  Created by Le Anh Nguyen on 5/14/24.
//

import SwiftUI

struct HomeView: View {
    @State var animate: Bool = false
    @ObservedObject var movieService = MovieService()
    @State private var searchTerm = ""
    @State private var tabs = ["Now Playing", "Upcoming", "Trending"]
    @State private var selectionIndex = 0


    
    @State var posters1: [String] = ["poster1", "poster2", "poster3", "poster4", "poster5", "poster6"]

    @State var posters2: [String] = ["poster7", "poster8", "poster9", "poster10", "poster11", "poster12"]

    @State var posters3: [String] = ["poster13", "poster0", "poster15", "poster16", "poster17", "poster18"]
    
    var body: some View {
        ZStack {
            CircleBackground(color: Color("greenCircle"))
                .blur(radius: animate ? 30 : 100)
                .offset(x: animate ? -50 : -130, y: animate ? -30 : -100)
                .task {
                    withAnimation(.easeInOut(duration: 7).repeatForever()) {
                        animate.toggle()
                    }
                }
            
            CircleBackground(color: Color("pinkCircle"))
                .blur(radius: animate ? 30 : 100)
                .offset(x: animate ? 100 : 130, y: animate ? 150 : 100)
                .task {
                    withAnimation(.easeInOut(duration: 4).repeatForever()) {
                        animate.toggle()
                    }
                }
            
            VStack(spacing: 0.0) {
                Text("Choose Movie")
                    .fontWeight(.bold)
                    .font(.title3)
                    .foregroundColor(.white)
                
                CustomSearchBar()
                    .padding(EdgeInsets(top: 30, leading: 20, bottom: 20, trailing: 20))
                
                VStack {
                    Picker("_", selection: $selectionIndex) {
                        ForEach(0..<tabs.count) { index in
                            Text(tabs[index])
                                .font(.title)
                                .bold()
                                .tag(index)
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                    .onChange(of: selectionIndex) { (_) in
                        if selectionIndex == 0 {
                            movieService.getNowPlaying()
                        } else if selectionIndex == 1 {
                            movieService.getUpcoming()
                        } else if selectionIndex == 2 {
                            movieService.getPopular()
                        }
                    }
                }.padding()
                
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: 20.0) {
                        Cards(searchTerm: $searchTerm, movieService: self.movieService)

                        ScrollSection(title: "Now Playing", posters: posters1)
                        
                        ScrollSection(title: "Coming Soon", posters: posters2)
                        
                        ScrollSection(title: "Top Movies", posters: posters3)
                        
                        ScrollSection(title: "Favorite", posters: posters1)
                    }
                    .padding(.bottom, 90)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        }
        .background(
            LinearGradient(gradient: Gradient(colors: [Color("backgroundColor"), Color("backgroundColor2")]), startPoint: .top, endPoint: .bottom)
        )
    }
}

private struct Cards: View {
    @Binding var searchTerm: String
    @ObservedObject var movieService: MovieService
    
    var body: some View {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack (spacing: 20) {
                ForEach(movieService.movies.filter {
                            searchTerm.isEmpty ? true :
                                $0.title?.lowercased().localizedStandardContains(searchTerm.lowercased()) ?? true }) { movie in
                    GeometryReader { geometry in
                        
                        NavigationLink(destination: FilmDetail(movie: movie)){
                        FilmCard(movie: movie)
//                            .rotation3DEffect(Angle(degrees: Double(geometry.frame(in: .global).minX) - 50) / -getAngleMultiplier(), axis: (x: 0, y: 10, z: 0))
                        }
                    }
                }
                .frame(width: 100, height: 130)
                .animation(.easeInOut(duration: 0.5))
                .transition(.opacity)
                .shadow(color: Color(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1))
                            .opacity(0.1), radius: 0, x: 7, y:7)
            }.onAppear {
                movieService.getNowPlaying()
                movieService.getActors()
            }
            .padding(.horizontal)
        }.onAppear(perform: {
            UIScrollView.appearance().bounces = false
        })
        
    }
}

#Preview {
    HomeView()
}
