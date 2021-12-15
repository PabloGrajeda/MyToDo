//
//  CreateGroupView.swift
//  MyToDo
//
//  Created by Pablo Grajeda on 7/12/21.
//

import SwiftUI

struct AddTextFieldView: View {
    
    @Binding var themeColor: UIColor
    @Binding var textfieldText: String
    @Binding var editingchanged: Bool
    
    var placeHolder: String
    var addAction: () -> Void
    
    var body: some View {
        VStack {
            HStack {
                TextField(placeHolder, text: $textfieldText, onEditingChanged: { editingChanged in
                    self.editingchanged = editingChanged
                })
                    .padding(.leading)
                    .frame(height: 50)
                    .background(Color(.systemGray6))
                    .foregroundColor(Color(themeColor))
                    .cornerRadius(20)
//                    .shadow(
//                        color: Color.black.opacity(0.15),
//                        radius: 10, x: 0, y: 0
//                    )
                    .padding(.trailing)
                Spacer()
                
                AddButton(color: themeColor, handler: addAction)
                    
                
            }
        }
        .padding()
    }
}

struct CreateGroupView_Previews: PreviewProvider {
    static var previews: some View {
        
        AddTextFieldView(themeColor: .constant(#colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)), textfieldText: .constant(""), editingchanged: .constant(false), placeHolder: "PlaceHolder", addAction: {})
            .previewLayout(.sizeThatFits)
    }
}

struct AddButton: View {
    var color: UIColor
    var handler: () -> Void
    
    var body: some View {
        
        Button(action: handler) {
            Image(systemName: "plus")
        }
        .frame(width: 50, height: 50)
        .foregroundColor(.white)
        .background((Color(color)))
        .cornerRadius(25)
//        .shadow(
//            color: Color.black.opacity(0.15),
//            radius: 10, x: 0, y: 0
//        )
    }
}


