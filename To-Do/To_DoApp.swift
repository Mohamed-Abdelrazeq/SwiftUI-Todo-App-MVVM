//
//  To_DoApp.swift
//  To-Do
//
//  Created by mohamed abdelrazek on 26/08/2022.
//

import SwiftUI

@main
struct To_DoApp: App {
    
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ListView()
            }
            .environmentObject(listViewModel)
            
        }
    }
}
