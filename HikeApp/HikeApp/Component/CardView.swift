//
//  CardView.swift
//  HikeApp
//
//  Created by Elif Bilge Parlak on 27.06.2023.
//

import SwiftUI

struct CardView: View {
    //MARK: - PROPERTIES
    @State private var imageNumber : Int = 1
    @State private var randomNumber : Int = 1
    
    //MARK: - FUNCTIONS
    func randomImage(){
        repeat {
            randomNumber = Int.random(in: 1...5)
        } while randomNumber == imageNumber
        imageNumber = randomNumber
    }
    
    var body: some View {
        //MARK: - CARD
        ZStack {
            CustomBackgroundView()
            VStack {
                //MARK: - HEADER
                VStack(alignment: .leading) {
                    HStack {
                        Text("Hiking")
                            .fontWeight(.black)
                            .font(.system(size: 52))
                            .foregroundStyle(
                            LinearGradient(colors: [.customGrayLight,.customGrayMedium], startPoint: .top, endPoint: .bottom))
                        Spacer()
                        
                        Button {
                            //ACTION: Show a sheet
                            print("Button pressed")
                        } label: {
                            CustomButtonView()
                        }
                        
                    }//HSTACK
                    Text("Fun and enjoyable outdoor activites for friends and family")
                        .multilineTextAlignment(.leading)
                        .italic()
                        .foregroundColor(.customGrayMedium)

                }.padding(.horizontal,30)
                //MARK: - MAIN CONTENT
                ZStack {
                    CustomCircleView()
                    Image("image-\(imageNumber)")
                        .resizable()
                    .scaledToFit()
                    .animation(.easeOut(duration: 1), value: imageNumber)
                }
                
                //MARK: - FOOTER
                Button {
                    //ACTION: Generate a random number
                    randomImage()
                } label: {
                    Text("Explore more")
                        .font(.title2)
                        .fontWeight(.heavy)
                        .foregroundStyle(LinearGradient(colors: [.customGreenLight,.customGreenMedium], startPoint: .top, endPoint: .bottom)
                        ).shadow(color: .black.opacity(0.25), radius: 0.25,x: 1, y: 2)
                }.buttonStyle(GradientButton())
             
            }//VSTACK
        }.frame(width: 320,height: 570)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView()
    }
}
