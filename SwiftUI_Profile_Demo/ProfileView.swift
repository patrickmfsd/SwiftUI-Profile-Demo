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

    @State var isPresented = false
    var SliderModalPresentation: some View {
        NavigationView {
            Form {
                Section(header: Text("Header Background Color")) {
                    colorSlider(value: $rValue, textColor: .red)
                    colorSlider(value: $gValue, textColor: .green)
                    colorSlider(value: $bValue, textColor: .blue)
                    HStack {
                        VStack {
                            RoundedRectangle(cornerRadius: 5)
                                .frame(width: 100)
                                .foregroundColor(Color(red: rValue, green: gValue, blue: bValue, opacity: 1.0))
                        }
                        VStack {
                            Text("R: \(Int(rValue * 255.0))")
                            Text("G: \(Int(gValue * 255.0))")
                            Text("B: \(Int(bValue * 255.0))")
                        }
                    }
                }
            }

            .navigationBarTitle(Text("Settings"))
                .navigationBarItems(
                    trailing: Button (action: { self.isPresented = false } ) { Text("Done")
                        .foregroundColor(.green)
                    }
            )
        }
    }

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
                        .foregroundColor(.gray)
                }.padding()
            }
            Spacer()
            Button (action: { self.isPresented = true }, label: {
                HStack {
                    Image(systemName: "slider.horizontal.3")
                        .imageScale(.large)
                    Text("Settings")
                        .bold()
                        .accessibility(label: Text("Settings"))
                }
                .padding()
            })
        }.sheet(isPresented: $isPresented, content: {
            self.SliderModalPresentation
        })
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ProfileView(rValue: 0.5, gValue: 0.5, bValue: 0.5)
    }
}
#endif
