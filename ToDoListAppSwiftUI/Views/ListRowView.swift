//
//  ListRowView.swift
//  ToDoListAppSwiftUI
//
//  Created by Apple on 23/05/24.
//

import SwiftUI

struct ListRowView: View {
    
    let item : ItemModel
    
    var body: some View {
        HStack{
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundColor(item.isCompleted ? Color.green : Color.red)
            Text(item.title)
            Spacer()
        }
        .font(.title2)
        .padding(.vertical,8)
    }
}
#Preview(traits: .sizeThatFitsLayout) {
    
   ListRowView(item: ItemModel(title: "This is first title", isCompleted: false))
       
    
   //ListRowView(item: ItemModel(title: "This is first title", isCompleted: true))
    
    
}
