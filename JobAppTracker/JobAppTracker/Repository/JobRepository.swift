//
//  JobRepository.swift
//  JobAppTracker
//
//  Created by Jack Wong on 10/6/20.
//

import Foundation
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift

class JobRepository: ObservableObject {
    
    let db = Firestore.firestore()
    
    @Published var jobs = [Job]()
    
    init() {
        loadData()
    }
    
    func loadData()  {
        guard let userId = Auth.auth().currentUser?.uid else {
            return
        }
        
        db.collection("jobs")
            .order(by: "createdTime")
            .whereField("userId", isEqualTo: userId)
            .addSnapshotListener { (querySnapshot, error) in
                if let querySnapshot = querySnapshot {
                    self.jobs = querySnapshot.documents.compactMap { document in
                        do {
                            let x = try document.data(as: Job.self)
                            return x
                        } catch {
                            print(error)
                        }
                        return nil
                    }
                }
            }
    }
    
    func addJob(_ job: Job)  {
        do {
            var addedJob = job
            addedJob.userId = Auth.auth().currentUser?.uid
            let _ = try db.collection("jobs").addDocument(from: addedJob)
        }
        catch {
            fatalError("unable to encode task: \(error.localizedDescription)")
        }
    }
    
    func updateJob(_ job: Job)  {
        if let docId = job.id {
            do {
                try db.collection("jobs").document(docId).setData(from: job)
            }
            catch {
                fatalError("unable to encode task: \(error.localizedDescription)")
            }
        }
    }
    
    func deleteJob(_ job: Job) {
        if let docId = job.id {
            db.collection("jobs").document(docId).delete() { err in
                if let err = err {
                    print("Error removing document: \(err)")
                } else {
                    print("Document successfully removed!")
                }
            }
        }
    }
}
