//
//  RingView.swift
//  JobAppTracker
//
//  Created by Jack Wong on 10/6/20.
//

import SwiftUI
struct RingView: View {
    
    var status: ApplicationStatus
    
    var color1 = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
    var color2 = #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)
    var width: CGFloat = 300
    var height: CGFloat = 300
    var percent: CGFloat {
        determinePercentage()
    }
    
    var body: some View {
        
        let multipler = width / 44
        let progress = 1 - (percent / 100)
        
        return ZStack {
            Circle()
                .stroke(Color.primary.opacity(0.1), style: StrokeStyle(lineWidth: 5 * multipler))
                .frame(width: width, height: height)
            
            Circle()
                .trim(from: progress, to: 1)
                .stroke(
                    LinearGradient(gradient: Gradient(colors: [Color(color1), Color(color2)]), startPoint: .topTrailing, endPoint: .bottomLeading),
                    style: StrokeStyle(lineWidth: 5 * multipler, lineCap: .round, lineJoin: .round, miterLimit: .infinity, dash: [20,0],
                                       dashPhase: 0))
                .rotationEffect(Angle(degrees: 90))
                .rotation3DEffect(Angle(degrees: 180), axis: (x: 1, y: 0, z: 0))
                .frame(width: width, height: height)
                .shadow(color: Color(color2).opacity(0.1), radius: 3 * multipler, x: 0, y: 3 * multipler)
            
            if status == .rejected {
                Image(systemName: "xmark")
                    .resizable()
                    .frame(width: width, height: height)
                    .foregroundColor(.red)
            } else {
                Text("\(Int(percent))%")
                    .font(.system(size: 14 * multipler))
                    .fontWeight(.bold)
            }
        }
    }
    
    private func determinePercentage() -> CGFloat {
        switch status {
        case .watching:
            return 0.0
        case .applied:
            return 33.0
        case .interviewing:
            return 66.0
        case .rejected:
            return 66.0
        case .offered:
            return 100.0
        }
    }
}

struct RingView_Previews: PreviewProvider {
    static var previews: some View {
        RingView(status: .applied)
            .previewDevice("iPhone 11 Pro")
    }
}
