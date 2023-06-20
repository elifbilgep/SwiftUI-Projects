//
//  NoItemsView.swift
//  TodoListSwiftUI
//
//  Created by Elif Bilge Parlak on 24.05.2023.
//

import SwiftUI

struct NoItemsView: View {
    @State var animate : Bool = false
    let secondaryAccentColor = Color("SecondaryAccentColor")
    var body: some View {
        ScrollView{
            VStack(spacing: 20){
                Text("There are no items!").font(.title).fontWeight(.semibold)
                
                Text("Are you a productive person? I think you should click the add button and add bunch of items to your todo list!").padding(.bottom,20)
                NavigationLink {
                    AddView()
                } label: {
                    Text("Add Something 🥳")
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(animate ? secondaryAccentColor: Color.accentColor)
                        .cornerRadius(10)
                    
                }.padding(.horizontal, animate ? 30 : 50)
                    .shadow(color: animate ? secondaryAccentColor.opacity(0.7) : Color.accentColor.opacity(0.7),
                            radius: animate ? 30 : 10,y: animate ? 40 : 30 )
                    .scaleEffect(animate ? 1.0 : 1.0)
                    .offset(y: animate ? -7 : 0)

                
            }
            .multilineTextAlignment(.center)
            .padding(40)
            .onAppear(perform: addAnimation)
            
        }.frame(maxWidth: .infinity,maxHeight: .infinity)
    }
    
    func addAnimation(){
        guard !animate else{return} // wont work above the code
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            withAnimation(Animation.easeInOut(duration: 2.5).repeatForever()){
                animate.toggle()
            }
        }
    }
}

struct NoItemsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            NoItemsView().navigationTitle("Title")
        }
        
    }
}
