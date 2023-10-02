//
//  ViewModel.swift
//  InstaSwiftUI
//
//  Created by Jordy Aguilar on 30/09/23.
//

import Foundation
import SwiftUI

class ViewModel : ObservableObject {
    @Published var timelineList = [TimelineModel]()
    @Published var storyList = [StoryModel]()
    
    init() {
        self.timelineList = TimelineModel.getPosts()
        self.storyList = StoryModel.getStories()
    }
}

