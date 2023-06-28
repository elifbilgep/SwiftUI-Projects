//
//  SettingsView.swift
//  Fructus
//
//  Created by Elif Bilge Parlak on 29.06.2023.
//

import SwiftUI

struct SettingsView: View {
    //MARK: - PROPERTIES
    @Environment(\.presentationMode) var presentationMode
    
    //MARK: - BODY
    var body: some View {
        NavigationView{
            ScrollView(.vertical){
                VStack(spacing:20){
                    //MARK: - SECTION 1
                    GroupBox(
                        label: SettingsLabelView(labelText: "Fructus", labelImage: "info.circle")){
                            Divider().padding(.vertical,4)
                            
                            HStack(alignment: .center,spacing: 10){
                                Image("logo")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 80, height: 80)
                                    .cornerRadius(10)
                                Text("most fruits are naturally low in fat, sodium and calories. Non have cholosterol, Fruits are sources of many essential nutrients including potassium, dieatry fiber, vitamins and much more")
                                    .font(.footnote)
                            }
                        }
                    
                    //MARK: - SECTION 2
                    
                    //MARK: - SECTION 3
                }//VStack
            }//Scroll
            .navigationTitle("Settings")
            .navigationBarItems(trailing: Button(
                action: {
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    Image(systemName: "xmark")
                })//Button
            )
            .padding()
        }//Navigation
    }
}

//MARK: - PREVIEW
struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}

