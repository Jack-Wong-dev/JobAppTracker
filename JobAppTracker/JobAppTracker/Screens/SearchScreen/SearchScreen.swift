//
//  SearchScreen.swift
//  JobAppTracker
//
//  Created by Jack Wong on 10/6/20.
//

import SwiftUI

struct SearchScreen: View {
    @State private var searchTerm = ""
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray)
                TextField("Enter search term", text: $searchTerm)
            }
            .modifier(TextFieldModifier())
            .onTapGesture(count: 1, perform: {})
            
            Spacer(minLength:70)
        }
        .padding()
        .contentShape(Rectangle())
        .onTapGesture(count: 1, perform: endEditing)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    private func endEditing() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

struct SearchScreen_Previews: PreviewProvider {
    static var previews: some View {
        SearchScreen()
    }
}

