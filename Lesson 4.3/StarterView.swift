//
//  StarterView.swift
//  Lesson 4.3
//
//  Created by Psycho on 14.09.2022.
//

import SwiftUI

struct StarterView: View {
    @AppStorage("signed") var userSignedIn = false
    
    var body: some View {
        Group {
            if userSignedIn {
                ContentView()
            } else {
                RegisterView()
            }
        }
    }
}

struct StarterView_Previews: PreviewProvider {
    static var previews: some View {
        StarterView()
    }
}
