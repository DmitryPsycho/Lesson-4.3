//
//  StarterView.swift
//  Lesson 4.3
//
//  Created by Psycho on 14.09.2022.
//

import SwiftUI

struct StarterView: View {
    @EnvironmentObject private var user: UserManager
    
    var body: some View {
        Group {
            if user.isSigned {
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
            .environmentObject(UserManager())
    }
}
