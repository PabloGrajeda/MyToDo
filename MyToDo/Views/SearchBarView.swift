//
//  SearchBarView.swift
//  MyToDo
//
//  Created by Pablo Grajeda on 10/12/21.
//

import SwiftUI

struct SearchBarView: View {
    @Binding var searchText: String
    @Binding var searchActive: Bool
    var body: some View {
        
        HStack {
            TextField("Search for a group", text: $searchText)
                .padding(.vertical, 10)
                .padding(.horizontal, 40)
                .onTapGesture {
                    searchActive = true
                }
                .background(Color(.systemGray6))
                .cornerRadius(20)
                .padding()
                .overlay(
                    HStack {
                        Image(systemName: "magnifyingglass")
                        Spacer()
                        if searchActive && searchText != "" {
                            
                            Button(action: {searchText = ""}) {
                                Image(systemName: "xmark.circle.fill")
                            }
                        }
                    }
                        .foregroundColor(.gray)
                        .padding(.horizontal, 30)
            )                
            if searchActive {
                Button(action: {
                    searchActive = false
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                }) {
                    Text("Cancel")
                }
                .padding()
                .transition(.move(edge: .trailing))
                .animation(.spring())
            }
            
        }
        
        

    }
}

struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarView(searchText: .constant(""), searchActive: .constant(false))
            .previewLayout(.sizeThatFits)
    }
}
