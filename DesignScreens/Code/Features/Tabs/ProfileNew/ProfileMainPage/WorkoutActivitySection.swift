//
//  WorkoutActivitySection.swift
//  DesignScreens
//
//  Created by Aziz's MacBook Air on 23.08.2023.
//

import SwiftUI

struct WorkoutActivitySection: View {
    var body: some View {
        VStack {
            HStack {
                Text("Workout Activity")
                    .foregroundColor(.white)
                    .font(.title.bold())
                    .multilineTextAlignment(.leading)
                
                Spacer()
            }
            .padding(.leading, 16)
            .padding(.top, 15)
            
            WorkoutActivitiesView()
            
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

struct WorkoutActivitiesView: View {
    var body: some View {
        VStack(spacing: 10){
            ForEach(0..<5) { index in
                WorkoutActivityItem()
            }
        }
    }
}

struct WorkoutActivityItem: View {
    var body: some View {
        Rectangle()
            .foregroundColor(.clear)
            .frame(height: 71)
            .background(Color(red: 0.05, green: 0.17, blue: 0.12))
            .cornerRadius(20)
            .overlay(
                ZStack {
                    HStack(spacing: 25){
                        
                        PercentProgressBar()
                        
                        VStack(alignment: .leading, spacing: 4){
                            Text("Fitness Lite")
                                .foregroundColor(.white)
                                .font(.system(size: Sizes.size(24), weight: .bold))
                            
                            Text("Total reps: 13")
                                .foregroundColor(.white)
                                .font(.caption2)
                        }
                        
                        
                        Spacer()
                    }
                    .padding(.leading, 12)
                    
                    HStack {
                        Spacer()
                        
                        VStack(spacing: 10){
                            Text("11.06.2023")
                                .foregroundColor(.white)
                                .font(.subheadline.bold())
                            
                            Text("06:30 AM")
                                .foregroundColor(Color("#BEBEBE"))
                                .font(.subheadline.bold())
                        }
                    }
                    .padding(.trailing, 15)
                    
                }
            )
    }
}

struct PercentProgressBar: View {
    @State var progress: Float = 0.5
    var image: String = ""
    
    var body: some View {
        ZStack(alignment: .center) {
            Circle()
                .stroke(lineWidth: 5)
                .foregroundColor(Color("#1C4520"))
                .frame(width: 45, height: 45)
            
            Circle()
                .trim(from: 0.0, to: CGFloat(min(self.progress, 1.0)))
                .stroke(style: StrokeStyle(lineWidth: 5, lineCap: .round, lineJoin: .round))
                .foregroundColor(Color("#42FF00"))
                .rotationEffect(Angle(degrees: 270.0))
                .animation(.linear)
                .frame(width: 45, height: 45)
            
            //                            Text(String(format: "%.0f %%", min(self.progress, 1.0)*100.0))
            //                                .font(.largeTitle)
            //                                .bold()
            
            Text("50%")
                .foregroundColor(.white)
                .font(.caption.bold())
            
        }
        
    }
}
