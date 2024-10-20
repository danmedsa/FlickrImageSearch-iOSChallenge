//
//  CVS_CodingChallengeApp.swift
//  CVS_CodingChallenge
//
//  Created by Daniel Medina Sada on 10/19/24.
//

import SwiftUI

@main
struct CVS_CodingChallengeApp: App {
    var body: some Scene {
        WindowGroup {
            MainFeedView(viewModel: .init())
        }
    }
}
