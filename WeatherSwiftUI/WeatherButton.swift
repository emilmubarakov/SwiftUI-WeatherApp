//
//  WeatherButton.swift
//  WeatherSwiftUI
//
//  Created by e.mubarakov on 01.05.2023.
//

import SwiftUI

struct WeatherButton: View {
    let title: String
    let textColor: Color
    let backgroundColor: Color
    
    var body: some View {
        Text("Change Day Time")
            .frame(width: 280, height: 50)
            .foregroundColor(textColor)
            .background(backgroundColor)
            .font(.system(size: 20, weight: .bold, design: .rounded))
            .cornerRadius(16)
    }
}
