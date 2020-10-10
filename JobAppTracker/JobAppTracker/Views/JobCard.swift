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
            HStack {
                VStack(alignment: .leading) {
                    Text(job.title)
                        .font(.title2).bold()
                    Text(job.companyName)
                        .font(Font.headline.weight(.semibold))
                    Text(job.location)
                        .font(Font.subheadline.weight(.semibold))
                }
                Spacer()
                RingView(width: 60, height: 60)
            }
            
            Text("Applied on: \(job.appliedDate.toString(.medium))")
                .font(Font.caption.weight(.semibold))
            
            Spacer()
            
            Text("Status: \(job.status)")
                .font(Font.callout.weight(.semibold))
            
        }
        .padding()
        .modifier(NeumorphicGreedy())
    }
}

//struct JobCard_Previews: PreviewProvider {
//    static var previews: some View {
//        VStack {
//            JobCard(job: jobData[0])
//                .frame(width: 200, height: 200)
//        }
//    }
//}
