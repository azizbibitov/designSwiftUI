//
//  TabsView.swift
//  DesignScreens
//
//  Created by Aziz's MacBook Air on 01.08.2023.
//

import SwiftUI

var tabImages: [String] = ["home_icon_new", "discovery_icon_new", "messaging_icon_new", "store_icon_new", "profile_icon_new"]

struct TabsView: View {
    
    @State var selectedTabIndex: Int = 0
    
    var body: some View {
        
        ZStack {
            
            VStack {
                switch selectedTabIndex {
                case 0:
                    HomeNew()
                case 1:
                    DiscoveryNew()
                case 2:
                    Messaging()
                case 3:
                    StoreNew()
                case 4:
                    ProfileNew()
                default: ZStack{}
                }
            }
            
            VStack {
                Spacer()
                
                Rectangle()
                    .foregroundColor(Color("#030317"))
                    .frame(maxWidth: .infinity, maxHeight: 85)
                    .cornerRadius(20, corners: [.topLeft, .topRight])
                    .overlay(
                        HStack(spacing: 40){
                            ForEach(0...4, id: \.self) { index in
                                TabIcon(image: tabImages[index], index: index, selectedTabIndex: $selectedTabIndex)
                            }
                        }
                    )
                
                
            }
            
            
        }.edgesIgnoringSafeArea(.all)
        
    }
}

struct TabIcon: View {
    
    var image: String
    var index: Int
    @Binding var selectedTabIndex: Int
    
    var body: some View {
        VStack(spacing: 9){
            
            Button {
                selectedTabIndex = index
            } label: {
                Image(image)
                    .renderingMode(.template)
                    .frame(width: 35, height: 35)
                    .foregroundColor(index == selectedTabIndex ? Color("#05FF00") : Color("#737474"))
            }
            
            
            Circle()
                .foregroundColor(index == selectedTabIndex ? Color("#05FF00") : Color("#737474"))
                .frame(width: index == selectedTabIndex ? 6 : 0, height: index == selectedTabIndex ? 6 : 0)
            
        }
    }
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        TabsView()
    }
}


