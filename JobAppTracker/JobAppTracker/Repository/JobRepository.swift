//
//  JobRepository.swift
//  JobAppTracker
//
//  Created by Jack Wong on 10/6/20.
//

import SwiftUI
//firestore modules goes here

class JobRepository: ObservableObject {
    
    //TODO:  firestore goes here
    
    @Published var jobs = [Job]()
    
    init() {
        loadData()
    }
    
    func loadData()  {
        //TODO: Implement Load data method
    }
    
    func addJob(_ job: Job)  {
        //TODO: Implement add job method
    }
    
    func updateJob(_ job: Job)  {
        //TODO: Implement update job method
    }
}
