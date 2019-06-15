//
//  ContentView.swift
//  SwiftUI_Experiment
//
//  Created by Patrick Mifsud on 4/6/19.
//  Copyright © 2019 Patrick Mifsud. All rights reserved.
//

import SwiftUI

struct ProfileView: View {
    @State var rValue: Double
    @State var gValue: Double
    @State var bValue: Double

    var body: some View {
        VStack {
            VStack {
                Header()
                    .foregroundColor(Color(red: rValue, green: gValue, blue: bValue, opacity: 1.0))
                    .edgesIgnoringSafeArea(.top)
                    .frame(height: 250)
                ProfileImage()
                    .offset(y: -120)
                    .padding(.bottom, -130)
                VStack {
                    Text("Patrick Mifsud")
                        .bold()
                        .font(.title)
                    Text("Software and Web Developer")
                        .font(.subheadline)
                        .color(.gray)
                }.padding()
                VStack {
                    Text("Use Sliders to Adjust Header Background Color:")
                    colorSlider(value: $rValue, textColor: .red)
                    colorSlider(value: $bValue, textColor: .blue)
                    colorSlider(value: $gValue, textColor: .green)
                }
                HStack {
                    Text("R: \(Int(rValue * 255.0))")
                    Text("G: \(Int(gValue * 255.0))")
                    Text("B: \(Int(bValue * 255.0))")
                }
            }
            Spacer()
        }
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ProfileView(rValue: 0.5, gValue: 0.5, bValue: 0.5)
    }
}
#endif
