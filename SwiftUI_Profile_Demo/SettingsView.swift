//
//  SettingsView.swift
//  SettingsView
//
//  Created by Patrick Mifsud on 25/8/21.
//  Copyright © 2021 Patrick Mifsud. All rights reserved.
//

import SwiftUI

struct SettingsView: View {
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        NavigationView {
            Form {
                HeaderBackgroundSliders()
                ProfileSettings()
            }
            .navigationBarTitle(Text("Settings"))
            .navigationBarItems(
                trailing:
                    Button (
                        action: {
                            self.presentationMode.wrappedValue.dismiss()
                        },
                        label: {
                            Text("Done")
                        }
                    )
            )
        }
    }
}
struct ProfileSettings: View {
    @AppStorage("name") var name = DefaultSettings.name
    @AppStorage("subtitle") var subtitle = DefaultSettings.subtitle
    @AppStorage("description") var description = DefaultSettings.description
    
    var body: some View {
        Section(header: Text("Profile")) {
            Button (
                action: {
                    // Action
                },
                label: {
                    Text("Pick Profile Image")
                }
            )
            TextField("Name", text: $name)
            TextField("Subtitle", text: $subtitle)
            TextEditor(text: $description)
        }
    }
}

struct HeaderBackgroundSliders: View {
    @AppStorage("rValue") var rValue = DefaultSettings.rValue
    @AppStorage("gValue") var gValue = DefaultSettings.gValue
    @AppStorage("bValue") var bValue = DefaultSettings.bValue
    
    var body: some View {
        Section(header: Text("Header Background Color")) {
            HStack {
                VStack {
                    RoundedRectangle(cornerRadius: 5)
                        .frame(width: 100)
                        .foregroundColor(Color(red: rValue, green: gValue, blue: bValue, opacity: 1.0))
                }
                //                VStack {
                //                    Text("R: \(Int(rValue * 255.0))")
                //                    Text("G: \(Int(gValue * 255.0))")
                //                    Text("B: \(Int(bValue * 255.0))")
                //                }
                VStack {
                    colorSlider(value: $rValue, textColor: .red)
                    colorSlider(value: $gValue, textColor: .green)
                    colorSlider(value: $bValue, textColor: .blue)
                }
            }
        }
    }
}


struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
