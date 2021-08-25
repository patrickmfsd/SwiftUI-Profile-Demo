//
//  HeaderProfileView.swift
//  SwiftUI_Experiment
//
//  Created by Patrick Mifsud on 13/6/19.
//  Copyright © 2019 Patrick Mifsud. All rights reserved.
//

import SwiftUI

struct Header: View {
    @AppStorage("rValue") var rValue = DefaultSettings.rValue
    @AppStorage("gValue") var gValue = DefaultSettings.gValue
    @AppStorage("bValue") var bValue = DefaultSettings.bValue
    
    var body: some View {
        ZStack(alignment: .top) {
            Rectangle()
                .foregroundColor(Color(red: rValue, green: gValue, blue: bValue, opacity: 1.0))
                .edgesIgnoringSafeArea(.top)
                .frame(height: 100)
            Image("profile")
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.white, lineWidth: 4))
                .shadow(radius: 10)
        }
    }
}
