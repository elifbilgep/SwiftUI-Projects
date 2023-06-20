//
//  AddView.swift
//  TodoListSwiftUI
//
//  Created by Elif Bilge Parlak on 23.05.2023.
//

import SwiftUI

struct AddView: View {
    @Environment(\.presentationMode) var presentationMode
    @State var textFieldtext : String = ""
    @EnvironmentObject var listViewModel : ListViewModel
    
    @State var alertTitle : String = ""
    @State var showAlert : Bool = false
    var body: some View {
        ScrollView{
            VStack {
                TextField("Type something here", text: $textFieldtext)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color.gray.opacity(0.15))
                    .cornerRadius(10)
                   
                    
                Button {
                    saveButtonPressed(title: textFieldtext)
                } label: {
                    Text("SAVE")
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 55)
                        .background(Color.accentColor )
                        .cornerRadius(10)
                        .fontWeight(.bold)
                        
                }

            }.padding(14)
            
            
        }.navigationTitle("Add an Item 🖊️")
            .alert(isPresented: $showAlert) {
                getAlert()
            }
    }
    
    func saveButtonPressed(title : String){
        if textIsAppropriate(){
            listViewModel.addItem(title: title)
            presentationMode.wrappedValue.dismiss()
        }
      
    }
    
    func textIsAppropriate() -> Bool{
        if textFieldtext.count < 3 {
            alertTitle = "Your new item must be at least 3 characters long 🤯"
            showAlert.toggle()
            return false
        }
        return true
    }
    
    func getAlert() -> Alert{
        return Alert(title: Text(alertTitle))
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            AddView()
        }.environmentObject(ListViewModel())
    }
}
