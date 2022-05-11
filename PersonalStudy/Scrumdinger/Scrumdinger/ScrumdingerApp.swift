//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by 강민규 on 2022/04/30.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
    @State private var scrums = DailyScrum.sampleData
    var body: some Scene {
        WindowGroup {
            NavigationView{
                ScrumsView(scrums: $scrums)
            }
        }
    }
}
