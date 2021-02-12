//
//  CreateNewBehavorial.swift
//  JobAppTracker
//
//  Created by Jack Wong on 2/11/21.
//

import SwiftUI

struct CreateNewBehavorialScreen: View {
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        ZStack {
            Color(.systemYellow).ignoresSafeArea()
            Button(action: dismiss) {
                Text("Coming soon.\nClick here to go back").bold()
            }
        }
    }
    
    private func dismiss() {
        presentationMode.wrappedValue.dismiss()
    }
}

struct CreateNewBehavorial_Previews: PreviewProvider {
    static var previews: some View {
        CreateNewBehavorialScreen()
    }
}
