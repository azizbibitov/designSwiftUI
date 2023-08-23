//
//  DailyStatisticsSection.swift
//  DesignScreens
//
//  Created by Aziz's MacBook Air on 23.08.2023.
//

import SwiftUI

struct DailyStatisticsSection: View {
    var body: some View {
        VStack {
            
            HStack {
                Text("Daily Statistics")
                    .foregroundColor(.white)
                    .font(.title.bold())
                    .multilineTextAlignment(.leading)
                Spacer()
            }
            .padding(.horizontal, 7)
            
            VStack(spacing: 11){
                
                HStack(spacing: 11) {
                    
                    StatisticItem(statisticsName: "Total repeats", statisticsCount: "50/100", statisticsMeasure: " repeats", statisticsImage: "repeats_icon")
                        .padding(.vertical, 11)
                    StatisticItem(statisticsName: "Calories", statisticsCount: "150/300", statisticsMeasure: " Kcal", statisticsImage: "calories_icon")
                        .padding(.vertical, 11)
                }
                
                
                HStack(spacing: 11) {
                    
                    StatisticItem(statisticsName: "Time spent", statisticsCount: "23/30", statisticsMeasure: " minutes", statisticsImage: "time_spent_icon")
                        .padding(.vertical, 11)
                    StatisticItem(statisticsName: "Steps", statisticsCount: "10000/6000", statisticsMeasure: " steps", statisticsImage: "steps_icon")
                        .padding(.vertical, 11)
                }
                
            }
            .padding(.horizontal, 7)
            
        }
    }
}

struct StatisticItem: View {
    var statisticsName: String = ""
    var statisticsCount: String = ""
    var statisticsMeasure: String = ""
    var statisticsImage: String = ""
    var body: some View {
        ZStack {
            HStack {
                VStack(alignment: .leading, spacing: 15){
                    Text(statisticsName)
                        .foregroundColor(.white.opacity(0.5))
                        .font(.caption)
                    
                    Group {
                        Text(statisticsCount)
                            .foregroundColor(.white)
                            .font(.system(size: Sizes.size(18), weight: .bold))
                        +
                        Text(statisticsMeasure)
                            .foregroundColor(.white)
                            .font(.system(size: Sizes.size(18)))
                    }
                    .padding(.trailing, 5)
                    
                }
                Spacer()
                ProgressBarWithImage(progress: 0.4, image: statisticsImage)
            }
            .padding(.horizontal, 15)
            
        }
        .background(
            Rectangle()
                .foregroundColor(.clear)
                .frame(height: 110)
                .background(Color("#21263D"))
                .cornerRadius(20)
        )
    }
}


struct ProgressBarWithImage: View {
    @State var progress: Float = 0.2
    var image: String = ""
    
    var body: some View {
        ZStack(alignment: .center) {
            Circle()
                .stroke(lineWidth: 12)
                .foregroundColor(Color("#1C4520"))
                .frame(width: 85, height: 85)
            
            Circle()
                .trim(from: 0.0, to: CGFloat(min(self.progress, 1.0)))
                .stroke(style: StrokeStyle(lineWidth: 12, lineCap: .round, lineJoin: .round))
                .foregroundColor(Color("#42FF00"))
                .rotationEffect(Angle(degrees: 270.0))
                .animation(.linear)
                .frame(width: 85, height: 85)
            
            //                            Text(String(format: "%.0f %%", min(self.progress, 1.0)*100.0))
            //                                .font(.largeTitle)
            //                                .bold()
            
            Image(image)
            
            Circle()
                .foregroundColor(.white)
                .frame(width: 10, height: 10)
                .offset(y: -(110/2-13))
                .rotationEffect(.degrees(Double(self.progress) * 360))
                .animation(.linear)
        }
        
    }
}

