//
//  LogoutButtonView.swift
//  Lesson 4.3
//
//  Created by Psycho on 17.09.2022.
//

import SwiftUI

struct LogoutButtonView: View {
    @EnvironmentObject private var user: UserManager
    
    @AppStorage("name") var currentUser: String?
    @AppStorage("signed") var userSignedIn = true
    
    var body: some View {
        Button(action: logOut) {
            Text("LogOut")
                .font(.title)
                .bold()
                .foregroundColor(.white)
        }
        .frame(width: 200, height: 60)
        .background(.blue)
        .cornerRadius(20)
        .overlay(RoundedRectangle(cornerRadius: 20).stroke(.black, lineWidth: 4))
        .padding()
    }
    
    private func logOut() {
        currentUser = nil
        userSignedIn = false
        user.name = ""
        user.isSigned = userSignedIn
    }
}

struct LogoutButtonView_Previews: PreviewProvider {
    static var previews: some View {
        LogoutButtonView()
            .environmentObject(UserManager())
    }
}
