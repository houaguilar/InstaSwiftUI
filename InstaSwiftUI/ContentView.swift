//
//  ContentView.swift
//  InstaSwiftUI
//
//  Created by Jordy Aguilar on 30/09/23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject private var viewModel = ViewModel()
    
    init(){
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor(named: "tabBar-bg")
        
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().compactAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                Divider().overlay(Color("primary"))
                    .frame(height: 1).opacity(0.4)
                ScrollView{
                    VStack{
                        storyList
                        Divider().overlay(Color("primary"))
                            .frame(height: 1).opacity(0.4)
                        ForEach(viewModel.timelineList) { timeline in
                            TimelineView(timeline: timeline)
                        }
                        Color.clear.padding(.bottom, 30)
                    }
                    .toolbar{
                        self.toolbarView()
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    var storyList: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(viewModel.storyList) { story in
                    StoryView(story: story)
                }
            }
            .padding(.leading, 10)
            .padding(.vertical, 8)
        }
    }
    
    @ToolbarContentBuilder
    func toolbarView() -> some ToolbarContent {
        ToolbarItem(placement: .topBarLeading) {
            Button(action: {}, label: {
                Image("camera-Icon")
                    .renderingMode(.template)
                    .foregroundColor(Color("primary"))
            })
        }
        
        ToolbarItem(placement: .principal) {
            Image("instagram-logo")
                .renderingMode(.template)
                .foregroundColor(Color("primary"))
        }
        
        ToolbarItem(placement: .topBarTrailing) {
            HStack {
                Button(action: {}, label: {
                    Image("igtv")
                        .renderingMode(.template)
                        .foregroundColor(Color("primary"))
                })
                Button(action: {}, label: {
                    Image("messanger")
                        .renderingMode(.template)
                        .foregroundColor(Color("primary"))
                })
            }
        }
    }
}

#Preview {
    ContentView()
}
