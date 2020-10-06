//
//  JobListViewModel.swift
//  JobAppTracker
//
//  Created by Jack Wong on 10/6/20.
//

import SwiftUI

class JobListViewModel: ObservableObject {
    
    @Published var jobRepository = JobRepository()
//    @Published var job =
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

