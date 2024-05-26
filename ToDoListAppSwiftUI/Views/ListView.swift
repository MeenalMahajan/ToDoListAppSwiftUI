//
//  ListView.swift
//  ToDoListAppSwiftUI
//
//  Created by Apple on 23/05/24.
//

import SwiftUI

struct ListView: View {
  
    @EnvironmentObject var listViewModel : ListViewModel
    
    var body: some View {
        
        ZStack{
         
            
            if listViewModel.items.isEmpty{
                
                NoItemsView()
                    .transition(AnyTransition.opacity
                        .animation(.easeIn))
                
            }else {
    
                List{
                    
                    ForEach(listViewModel.items) { item in
                        
                        ListRowView(item: item)
                            .onTapGesture {
                                withAnimation(.linear){
                                    listViewModel.update(item: item)
                                }
                            }
                    }
                    .onDelete(perform: listViewModel.deleteItem)
                    .onMove(perform: listViewModel.moveItems)
                }
                .listStyle(PlainListStyle())
            }
            
        }
        .toolbar{
            ToolbarItemGroup(placement: .topBarLeading) {EditButton().foregroundColor(.purple)}
            ToolbarItemGroup(placement: .topBarTrailing) {
                NavigationLink("Add") {AddView()}.foregroundColor(.purple)
            }
        }
        .navigationTitle("ToDO List 📝")
        .accentColor(.purple)
    }
    
    
}

#Preview {
    
    NavigationStack{
        ListView()
    }.environmentObject(ListViewModel())
}


