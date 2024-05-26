//
//  ListViewModel.swift
//  ToDoListAppSwiftUI
//
//  Created by Apple on 23/05/24.
//

import Foundation

class ListViewModel : ObservableObject{
    
    @Published var items : [ItemModel] = [] {
        didSet{
            save()
        }
    }
    let itemsKey : String = "items_list"
    
    init(){
        getItems()
    }
    
    
    func getItems(){
        
        guard 
            let data = UserDefaults.standard.data(forKey: itemsKey),
            let savedItems = try? JSONDecoder().decode([ItemModel].self, from: data)
        else{ return }
        
        self.items = savedItems
        
    }
    
    func deleteItem(indexSet : IndexSet){
        
        items.remove(atOffsets: indexSet)
    }
    func moveItems(indices : IndexSet, newOffset : Int){
     
        items.move(fromOffsets: indices, toOffset: newOffset)
    }
    func addItems(title : String){
        
        let newItem = ItemModel(title: title, isCompleted: false)
        items.append(newItem)
    }
    func update(item : ItemModel){
        
        //        if let index = items.firstIndex(where: { existingItem in
        //            return existingItem.id == item.id
        //        }){}
        
        //can also write it as this using closures shorthand
        
        
        if let index = items.firstIndex(where: { $0.id == item.id })
        {
            items[index] = item.updateModel()
        }
        
    }
    func save(){
        
        if let encodedData = try? JSONEncoder().encode(items) {
            UserDefaults.standard.setValue(encodedData, forKey: itemsKey)
        }
    }
    
    
}
