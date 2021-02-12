//
//  JobCard.swift
//  JobAppTracker
//
//  Created by Jack Wong on 10/6/20.
//

import SwiftUI

struct JobCardView: View {
    let job : Job
    var namespace: Namespace.ID
        
    var body: some View {
        ZStack {
            NeumorphicCard()
                .matchedGeometryEffect(id: "Job \(String(describing: job.id))", in: namespace)
            
            VStack(alignment: .leading) {
                HStack(alignment: .top) {
                    VStack(alignment: .leading) {
                        Text(job.title)
                            .font(.title2).bold()
                         
                        Text(job.companyName)
                            .font(Font.headline.weight(.bold))
                        
                        Text(job.location)
                            .font(Font.headline.weight(.semibold))
                        
                        if job.remote { Text("Remote") }
                        
                        if !job.salary.isEmpty { Text("Salary: \(job.salary)") }
                    }
                    .font(Font.subheadline.weight(.semibold))
                    
                    Spacer()
                    
                    RingView(status: job.status, width: 60, height: 60)
                }  /* HStack: Top portion of the card */
                .matchedGeometryEffect(id: "Header \(String(describing: job.id))", in: namespace)
                
                Text("Applied on: \(job.appliedDate.toString(.medium))")
                    .font(Font.caption.weight(.semibold))
                    .matchedGeometryEffect(id: "Date \(String(describing: job.id))", in: namespace)
                
                Spacer()
                
                HStack {
                    Text("Status: ")
                        
                    Text(job.status.id.capitalized)
                        .foregroundColor(Color(job.status.color))
                        .fontWeight(.heavy)
                } /* HStack */
                .font(Font.callout.weight(.semibold))
                .matchedGeometryEffect(id: "Status \(String(describing: job.id))", in: namespace)
            } /* VStack: Entire card */
            .padding()
            .frame(height: 200)
        } /* ZStack */
    }
}

struct JobCard_Previews: PreviewProvider {
    @Namespace static var ns
    
    static var previews: some View {
        VStack {
            JobCardView(job: jobData[0], namespace: ns)
                .frame(width: 300, height: 200)
        }
    }
}

