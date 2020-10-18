//
//  JobCard.swift
//  JobAppTracker
//
//  Created by Jack Wong on 10/6/20.
//

import SwiftUI

struct JobCard: View {
    let job : Job
    
    var body: some View {
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
            
            Text("Applied on: \(job.appliedDate.toString(.medium))")
                .font(Font.caption.weight(.semibold))
            
            Spacer()
            
            HStack {
                Text("Status: ")
                    
                Text(job.status.id.capitalized)
                    .foregroundColor(Color(job.status.color))
                    .fontWeight(.heavy)
            }
            .font(Font.callout.weight(.semibold))

            
        } /* VStack: Entire card */
        .padding()
        .modifier(NeumorphicGreedy())
    }
}

struct JobCard_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            JobCard(job: jobData[0])
                .frame(width: 300, height: 200)
        }
    }
}

