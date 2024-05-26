//
//  ToDoListAppSwiftUIApp.swift
//  ToDoListAppSwiftUI
//
//  Created by Apple on 23/05/24.
//

import SwiftUI

@main
struct ToDoListAppSwiftUIApp: App {
  
    @StateObject var listViewModel : ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            
            NavigationStack{
                ListView()
            }
            .accentColor(.purple)
            .environmentObject(listViewModel)
        }
    }
}
