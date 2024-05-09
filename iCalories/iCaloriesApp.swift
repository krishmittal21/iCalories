//
//  iCaloriesApp.swift
//  iCalories
//
//  Created by Krish Mittal on 09/05/24.
//

import SwiftUI

@main
struct iCaloriesApp: App {
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext,dataController.container.viewContext)
        }
    }
}
