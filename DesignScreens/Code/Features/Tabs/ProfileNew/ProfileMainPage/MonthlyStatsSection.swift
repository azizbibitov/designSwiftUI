//
//  MonthlyStatsSection.swift
//  DesignScreens
//
//  Created by Aziz's MacBook Air on 23.08.2023.
//

import SwiftUI

struct MonthlyStatsSection: View {
    var body: some View {
        VStack {
            HStack {
                Text("Monthly Stats")
                    .foregroundColor(.white)
                    .font(.title.bold())
                    .multilineTextAlignment(.leading)
                
                Spacer()
            }
            .padding(.leading, 16)
            .padding(.top, 15)
            
            MonthlyStatsTabs()
            
            CalendarTabView()
            
            Spacer()
        }
        .background(
            Rectangle()
                .foregroundColor(.clear)
                .background(Color("#141E26"))
                .cornerRadius(20)
        )
        .padding(.horizontal, 7)
        .padding(.top, 35)
        
    }
}

struct CalendarTabView: View {
    
    var colors: [String] = ["#2E2E2E", "#BDECB6", "#44944A", "#00FF00"]
    var colorsOpacity: [CGFloat] = [1, 0.8, 1, 1]
    @State private var index = 0
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Text("Fri, 27 June 2023")
                        .foregroundColor(.white)
                        .font(.title3.bold())
                    
                    Spacer()
                    
                    HStack(spacing: 5){
                        Text("Less")
                            .foregroundColor(.white)
                            .font(.footnote)
                        
                        HStack(spacing: 3){
                            ForEach(0..<4) { index in
                                Rectangle()
                                    .foregroundColor(.clear)
                                    .frame(width: 19, height: 17)
                                    .background(Color(colors[index])?.opacity(colorsOpacity[index]))
                                    .cornerRadius(5)
                            }
                        }
                        
                        Text("More")
                            .foregroundColor(.white)
                            .font(.footnote)
                    }
                }
                .padding(.horizontal, 15)
                
                TabView(selection: $index) {
                    ForEach((0..<3), id: \.self) { index in
                        CustomCalendarView(year: 2023, month: 8 + index)
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                .frame(height: 220)
                
                
                
                HStack(spacing: 15) {
                    ForEach((0..<3), id: \.self) { index in
                        Circle()
                            .fill(index == self.index ? Color.white : Color(red: 0.85, green: 0.85, blue: 0.85).opacity(0.10))
                            .frame(width: 5, height: 5)
                        
                    }
                }
                .padding(.vertical, 5)
                .padding(.horizontal, 12)
                .background(Color(red: 0.85, green: 0.85, blue: 0.85).opacity(0.1))
                .cornerRadius(10)
                .padding(.vertical, 5)
                
            }
        }
        .padding(.top, 13)
    }
}

struct CustomCalendarView: View {
    let year: Int
    let month: Int
    
    private var startDate: Date {
        let components = DateComponents(year: year, month: month, day: 1)
        return Calendar.current.date(from: components)!
    }
    
    private var endDate: Date {
        var components = DateComponents()
        components.month = 1
        components.day = -1
        return Calendar.current.date(byAdding: components, to: startDate)!
    }
    
    private func daysInMonth(date: Date) -> Int {
        let range = Calendar.current.range(of: .day, in: .month, for: date)!
        return range.count
    }
    
    private func dayOfWeek(date: Date) -> Int {
        let weekday = Calendar.current.component(.weekday, from: date)
        // Adjust weekday indexing to start from Sunday (1) instead of Monday (2)
        return (weekday + 6) % 7
    }
    
    var weekDays: [String] = ["Mon", "Tues", "Wed", "Thur", "Fri", "Sat", "Sun"]
    
    var body: some View {
        VStack {
            
            ZStack {
                
                
                LazyVGrid(columns: Array(repeating: GridItem(.fixed(45)), count: 7), spacing: 16) {
                    
                    ForEach(1...(daysInMonth(date: startDate) + dayOfWeek(date: startDate) - 1), id: \.self) { day in
                        if day >= dayOfWeek(date: startDate) {
                            Text("\(day - dayOfWeek(date: startDate) + 1)")
                                .foregroundColor((day - dayOfWeek(date: startDate) + 1) == 10 ? Color.white : Color("#646464"))
                                .font(.system(size: 14, weight: .bold))
                                .frame(width: 20, height: 20)
                                .background((day - dayOfWeek(date: startDate) + 1) == 10 ? Color(hex: "#00FF00") : Color(hex: "#3e3e3e"))
                                .cornerRadius(6)
                        } else {
                            Text("")
                        }
                    }
                    
                    
                }
                
                LazyVGrid(columns: Array(repeating: GridItem(.fixed(45)), count: 7), spacing: 16) {
                    ForEach(0..<7) { _ in
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 34, height: 150)
                            .background(
                                LinearGradient(
                                    stops: [
                                        Gradient.Stop(color: Color(red: 0.18, green: 0.93, blue: 0.06).opacity(0), location: 0.00),
                                        Gradient.Stop(color: .white.opacity(0.09), location: 0.49),
                                        Gradient.Stop(color: .white.opacity(0), location: 1.00),
                                    ],
                                    startPoint: UnitPoint(x: 0.5, y: 1),
                                    endPoint: UnitPoint(x: 0.5, y: 0)
                                )
                            )
                    }
                    
                    
                }
                
                
                
            }
            .padding(.vertical)
            
            LazyVGrid(columns: Array(repeating: GridItem(.fixed(45)), count: 7), spacing: 16) {
                ForEach(weekDays) { day in
                    Text(day)
                        .foregroundColor(.white)
                        .font(.footnote)
                }
                
                
            }
        }
    }
}

struct MonthlyStatsTabs: View {
    
    var monthlyStats: [String] = ["Calories", "Time Spent", "Repeats", "Steps"]
    @State var selectedIndex: Int = 2
    var body: some View {
        ZStack {
            Color("#00FF1A")?.opacity(0.1).cornerRadius(10)
            HStack(){
                ForEach(0..<4) { index in
                    
                    Button {
                        print(index)
                        withAnimation {
                            selectedIndex = index
                        }
                    } label: {
                        Rectangle()
                            .foregroundColor(selectedIndex == index ? Color("#00C844") : Color.clear)
                            .frame(height: 40)
                            .cornerRadius(10)
                            .overlay(
                                Text(monthlyStats[index])
                                    .foregroundColor(.white)
                                    .font(.system(size: Sizes.size(17), weight: .bold))
                            )
                    }
                }
            }
        }
        .frame(height: 40)
        .padding(.horizontal, 13)
    }
}

