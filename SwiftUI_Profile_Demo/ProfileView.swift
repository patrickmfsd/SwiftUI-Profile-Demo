//
//  ContentView.swift
//  SwiftUI_Experiment
//
//  Created by Patrick Mifsud on 4/6/19.
//  Copyright © 2019 Patrick Mifsud. All rights reserved.
//

import SwiftUI

struct ProfileView: View {
    @State var isPresented = false

    var body: some View {
        VStack {
            VStack {
                Header()
                ProfileText()
            }
            Spacer()
            Button (
                action: { self.isPresented = true },
                label: {
                    Label("Edit", systemImage: "pencil")
            })
            .sheet(isPresented: $isPresented, content: {
                SettingsView()
            })
        }
    }
}

struct ProfileText: View {
    @AppStorage("name") var name = DefaultSettings.name
    @AppStorage("subtitle") var subtitle = DefaultSettings.subtitle
    @AppStorage("description") var description = DefaultSettings.description
    
    var body: some View {
        VStack(spacing: 15) {
            VStack(spacing: 5) {
                Text(name)
                    .bold()
                    .font(.title)
                Text(subtitle)
                    .font(.body)
                    .foregroundColor(.secondary)
            }.padding()
            Text(description)
                .multilineTextAlignment(.center)
                .padding()
            Spacer()
        }
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
#endif
