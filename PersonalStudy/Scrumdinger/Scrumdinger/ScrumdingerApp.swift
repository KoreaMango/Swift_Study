//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by 강민규 on 2022/04/30.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
    var body: some Scene {
        WindowGroup {
            ScrumsView(scrums: DailyScrum.sampleData)
        }
    }
}
