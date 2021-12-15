//
//  ContentView.swift
//  MyToDo
//
//  Created by Pablo Grajeda on 7/12/21.
//

import SwiftUI
import RealmSwift

struct GroupView: View {
    @EnvironmentObject var groupViewModel: GroupViewModel
    
    var body: some View {
        ZStack {
            if let groups = groupViewModel.groups {
                if groups.isEmpty {
                    NoItemsView()
                        .offset(y: -100)
                    
                } else {
                    List {
                        ForEach(groups) { group in
                            if !group.isInvalidated {
                                NavigationLink(destination: TaskView(for: group)) {
                                    HStack {
                                        Image(systemName: "list.bullet")
                                            .foregroundColor(Color(group.color))
                                        Text(group.name)
                                            .foregroundColor(Color(group.color))
                                    }
                                }
                            }
                            
                        }
                        .onDelete(perform: groupViewModel.delete)
                        
                        
                    }
                    .padding(.bottom, groupViewModel.showColorPicker ? 150 : 100)
                }
            }
            
            VStack {
                AddTextFieldView(themeColor: $groupViewModel.selectedColor, textfieldText: $groupViewModel.groupName, editingchanged: $groupViewModel.showColorPicker, placeHolder: "New Group", addAction:
                                    groupViewModel.add)
                
                
                if groupViewModel.showColorPicker {
                    ColorPickerView(selectedColor: $groupViewModel.selectedColor)
                }
                
            }
            .frame(maxHeight: .infinity ,alignment: .bottom)
            .padding(.bottom)
        }
        .navigationTitle("My Groups")
        .onAppear {
            // print(Realm.Configuration.defaultConfiguration.fileURL)
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            GroupView()
        }
        .environmentObject(GroupViewModel())
    }
}



