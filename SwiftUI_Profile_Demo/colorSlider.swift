//
//  colorSlider.swift
//  SwiftUI_Experiment
//
//  Created by Patrick Mifsud on 13/6/19.
//  Copyright © 2019 Patrick Mifsud. All rights reserved.
//

import SwiftUI

struct colorSlider: View {
    @Binding var value: Double
    var textColor: Color
    
    var body: some View {
        HStack {
            Text("0")
                .color(textColor)
            Slider(value: $value, from: 0.0, through: 1.0)
                .frame(width: 300)
            Text("255")
                .color(textColor)
            }.padding()
    }
}
