//
//  NoItemsView.swift
//  ToDoListAppSwiftUI
//
//  Created by Apple on 23/05/24.
//

import SwiftUI

struct NoItemsView: View {
    
    @State var animate : Bool = false
    var body: some View {
        
        ScrollView{
            
            VStack {
                Text("OOPs No items here...")
                    .font(.title)
                    .fontWeight(.semibold)
                    
                
                NavigationLink(destination: AddView()) {
                    Text("Add Something 😎")
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(animate ? Color.purple : Color.pink)
                        .cornerRadius(10)
                }
                .padding(animate ? 30 : 50)
                .shadow(color: animate ? Color.purple.opacity(0.7) : Color.pink.opacity(0.7),
                        radius: animate ? 30 : 10,
                        x: 0,
                        y: animate ? 50 : 30)
                    .scaleEffect(animate ? 1.1 : 1.0)
                    .offset(y : animate ? -7 : 0)
                    .onAppear(perform: addAnimation)
            }.padding(40)
                
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    func addAnimation(){
        
        guard !animate else{ return}
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            
            withAnimation(
                Animation
                    .easeInOut(duration: 2.0)
                    .repeatForever()
            ){
                
                animate.toggle()
            }
        }
    }
}

#Preview {
    NavigationStack{
        NoItemsView()
            .navigationTitle("Title")
    }
}
