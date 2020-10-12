//
//  FABStyle.swift
//  JobAppTracker
//
//  Created by Jack Wong on 10/12/20.
//

import SwiftUI

struct FABStyle: ButtonStyle {
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .opacity(configuration.isPressed ? 0.7 : 1)
            .scaleEffect(configuration.isPressed ? 0.8 : 1)
    }
}
