//
//  NoItemsView.swift
//  MyToDo
//
//  Created by Pablo Grajeda on 13/12/21.
//

import SwiftUI

struct NoItemsView: View {
    @State var animate: Bool = false
    private let primaryColor = Color.init(#colorLiteral(red: 0.3236978054, green: 0.1063579395, blue: 0.574860394, alpha:   1))
    private let secondaryColor = Color.init(#colorLiteral(red: 0.5808190107, green: 0.0884276256, blue: 0.3186392188, alpha: 1))
    
    var body: some View {
        
        VStack(spacing: 10) {
            Text("There are no groups yet!")
                .font(.title)
                .fontWeight(.semibold)
            Text("Are you a productive person? Let's add a new group and start adding some tasks!")
                .padding(.bottom)
            
            
            
            Text("Add something 🥳")
                .foregroundColor(.white)
                .font(.headline)
                .frame(height: 50)
                .frame(maxWidth: .infinity)
                .background(animate ? secondaryColor : primaryColor)
                .cornerRadius(10)
                .scaleEffect(animate ? 1.1 : 1.0)
                .shadow(
                    color: animate ? secondaryColor.opacity(0.7) : primaryColor.opacity(0.7),
                    radius: animate ? 30 : 10,
                    x: 0,
                    y: animate ? 50 : 30)
            
            
            
            
        }
        .multilineTextAlignment(.center)
        .padding(40)
        .onAppear(perform: addAnimation)
    }
    
    func addAnimation() {
        guard !animate else { return }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            withAnimation (
                Animation
                    .easeInOut(duration: 2.0)
                    .repeatForever()
            ) {
                self.animate.toggle()
            }
        }
    }
    
}



struct NoItemsView_Previews: PreviewProvider {
    static var previews: some View {
        
        NoItemsView()
        
        
    }
}
