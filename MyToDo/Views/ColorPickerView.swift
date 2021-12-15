//
//  ColorPickerView.swift
//  MyToDo
//
//  Created by Pablo Grajeda on 7/12/21.
//

import SwiftUI

struct ColorPickerView: View {
    var colors = [#colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1), #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1), #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1), #colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1), #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1), #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)]
    @Binding var selectedColor: UIColor
    
    var body: some View {
        HStack {
            ForEach(0..<colors.count) { index in
                Button(action: {
                    self.selectedColor = colors[index]
                }) {
        
                    ColorSquare(color: colors[index], picked: index == colors.firstIndex(of: selectedColor))
                        .padding(.horizontal, 5)
                }
            }
        }
    }
}

struct ColorPickerView_Previews: PreviewProvider {
    static var previews: some View {
        ColorPickerView(selectedColor: .constant(#colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)))
            .previewLayout(.sizeThatFits)
    }
}

struct ColorSquare: View {
    let color: UIColor
    let picked: Bool
    
    var body: some View {
        if picked {
            RoundedRectangle(cornerRadius: 15)
                .frame(width: 50, height: 50)
                .foregroundColor(Color(color))
                .overlay(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(Color.blue, lineWidth: 2)
                )
                
        } else  {
            RoundedRectangle(cornerRadius: 15)
                .frame(width: 50, height: 50)
                .foregroundColor(Color(color))
        }
    }
    
}
