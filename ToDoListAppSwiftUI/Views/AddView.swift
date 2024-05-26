//
//  AddView.swift
//  ToDoListAppSwiftUI
//
//  Created by Apple on 23/05/24.
//

import SwiftUI

struct AddView: View {
    
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var listViewModel : ListViewModel
    
    @State var textFieldText : String = ""
    @State var alertTitle : String = ""
    @State var showAlert : Bool = false
   // var greycolor = Color(#colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1))
    
    var body: some View {
        
        ScrollView{
    
            VStack {
                TextField("Type Something here", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(UIColor.secondarySystemBackground))
                .cornerRadius(10)
                
                Button(action: saveButtonPressed, label: {
                    Text("Save".uppercased())
                        .foregroundColor(.white)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.purple)
                        .cornerRadius(10)
                })
            }
            .padding()
        }
        .navigationTitle("Add An Item 🖊️")
        .accentColor(.purple)
        .alert(isPresented: $showAlert, content: getAlert)
    
    }
    
    func saveButtonPressed(){
        
        if textIsAppropriate(){
            listViewModel.addItems(title: textFieldText)
            dismiss()
        }
    }
    func textIsAppropriate() -> Bool{
        
        if textFieldText.count < 3{
            
            alertTitle = "Item must be 3 characters long 😰"
            showAlert.toggle()
            return false
        }
        return true
    }
    func getAlert() -> Alert{
        
        return Alert(title: Text(alertTitle))
        
    }
}

#Preview {
    NavigationStack{
        AddView()
    }.environmentObject(ListViewModel())
}
