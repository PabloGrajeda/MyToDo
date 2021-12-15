//
//  MyToDoApp.swift
//  MyToDo
//
//  Created by Pablo Grajeda on 7/12/21.
//

import SwiftUI

@main
struct MyToDoApp: App {
    @State var groupViewModel = GroupViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                GroupView()
            }
            .environmentObject(groupViewModel)
        }
    }
}

struct Safe<T: RandomAccessCollection & MutableCollection, C: View>: View {
   
   typealias BoundElement = Binding<T.Element>
   private let binding: BoundElement
   private let content: (BoundElement) -> C

   init(_ binding: Binding<T>, index: T.Index, @ViewBuilder content: @escaping (BoundElement) -> C) {
      self.content = content
      self.binding = .init(get: { binding.wrappedValue[index] },
                           set: { binding.wrappedValue[index] = $0 })
   }
   
   var body: some View {
      content(binding)
   }
}
