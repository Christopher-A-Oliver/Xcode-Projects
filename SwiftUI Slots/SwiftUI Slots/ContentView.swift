//
//  ContentView.swift
//  SwiftUI Slots
//
//  Created by クリストファー　オリバー on 2022/11/08.
//

import SwiftUI

struct ContentView: View {
    @State var credits = 1000
    @State var slot1 = 1
    @State var slot2 = 1
    @State var slot3 = 1
    
    var body: some View {
        VStack (spacing: 60.0){
            Spacer()
            Text("SwiftUI Slots!").font(.largeTitle)
            Spacer()
            
            Text("Credits: \(credits)")

            // Add the images and resize them with a resizable and aspectratio modifiers
            HStack {
                Image("slot\(slot1)")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Image("slot\(slot2)")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Image("slot\(slot3)")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            Spacer()
            
            Button("Spin"){
                
                // Randomize the number for the slots
                slot1 = Int.random(in: 1...3)
                slot2 = Int.random(in: 1...3)
                slot3 = Int.random(in: 1...3)
                
                // Check if we have 3 of a pair and if so we gain credit, if not we lose credits
                if slot1 == slot2 && slot2 == slot3 {
                    // we have a match
                    credits += 15
                }
                else {
                    // no match
                    credits -= 5
                }
                
            }
            // Set the padding
            .padding()
            // Adjust the left and right paddding to be bigger
            .padding([.leading, .trailing],40)
            .foregroundColor(Color.white)
            .background(Color.pink)
            .cornerRadius(25)
            .font(.system(size: 18,weight: .bold, design: .default))
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().preferredColorScheme(.light)
    }
}
