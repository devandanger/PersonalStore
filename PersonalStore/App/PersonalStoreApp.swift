//
//  PersonalStoreApp.swift
//  PersonalStore
//
//  Created by Evan Anger on 7/10/21.
//

import SwiftUI

@main
struct PersonalStoreApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            AppListView()
        }
    }
}
