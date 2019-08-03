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
            Text(verbatim: "0")
                .foregroundColor(textColor)
            Slider(value: $value, in: 0.0...1.0)
            Text(verbatim: "255")
                .foregroundColor(textColor)
            
        }
    }
}
