//
//  ContentView.swift
//  WeatherSwiftUI
//
//  Created by e.mubarakov on 01.05.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var isNight = false
    
    var body: some View {
        ZStack {
            BackgroundColor(isNight: isNight)
            VStack {
                CityTextView(title: "Moscow")
                MainWeatherTemperatureView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill",
                                      temp: 21)
                HStack(spacing: 25) {
                    DailyWeatherView(dayOfWeek: "SUN",
                                   imageName: "sun.max.fill",
                                   temp: 24)
                    DailyWeatherView(dayOfWeek: "MON",
                                   imageName: "wind.snow",
                                   temp: 20)
                    DailyWeatherView(dayOfWeek: "TUE",
                                   imageName: "snow",
                                   temp: 1)
                    DailyWeatherView(dayOfWeek: "WED",
                                   imageName: "wind.snow",
                                   temp: 7)
                    DailyWeatherView(dayOfWeek: "THU",
                                   imageName: "snow",
                                   temp: -4)
                    DailyWeatherView(dayOfWeek: "FRI",
                                   imageName: "cloud.sun.fill",
                                   temp: 3)
                }
                Spacer()
                
                Button {
                    isNight.toggle()
                } label: {
                    WeatherButton(title: "Change Day Time", textColor: .blue, backgroundColor: .white)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct BackgroundColor: View {
    var isNight: Bool
    
    var body: some View {
        LinearGradient(colors: [isNight ? .black : .blue, isNight ? .gray : .init("lightBlue")], startPoint: .topLeading, endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
    }
}

struct DailyWeatherView: View {
    let dayOfWeek: String
    let imageName: String
    let temp: Int
    
    var body: some View {
        VStack {
            Text(dayOfWeek)
                .font(.system(size: 16, weight: .medium, design: .rounded))
                .foregroundColor(.white)
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text("\(temp)°")
                .font(.system(size: 20, weight: .medium, design: .rounded))
                .foregroundColor(.white)
        }
    }
}

struct CityTextView: View {
    let title: String
    
    var body: some View {
        Text(title)
            .font(.system(size: 32, weight: .medium, design: .rounded))
            .foregroundColor(.white)
            .padding()
    }
}

struct MainWeatherTemperatureView: View {
    let imageName: String
    let temp: Int
    
    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            Text("\(temp)°")
                .font(.system(size: 70, weight: .medium, design: .rounded))
                .foregroundColor(.white)
        }
        .padding(.bottom, 40)
    }
}
