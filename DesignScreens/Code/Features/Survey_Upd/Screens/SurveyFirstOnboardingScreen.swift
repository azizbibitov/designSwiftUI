//
//  SurveyFirstOnboardingScreen.swift
//  DesignScreens
//
//  Created by Aziz's MacBook Air on 20.07.2023.
//

import SwiftUI
import AVKit

struct SurveyFirstOnboardingScreen: View {
    
    var playerItem = AVPlayerItem(url: URL(fileURLWithPath: Bundle.main.path(forResource: "süleymanin_mustafasina_siiri", ofType: "mp4")!))
    @State var playerLooper: AVPlayerLooper!
    @State var queuePlayer = AVQueuePlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "süleymanin_mustafasina_siiri", ofType: "mp4")!))
    
    @State private var nextBtnEnabled: Bool = true
    @EnvironmentObject var basicSurveyVM: SurveyVM
    var body: some View {
        
        
        ZStack {
            GeometryReader { proxy in
                AVPlayerControllerRepresented(player: queuePlayer)
                    .ignoresSafeArea()
                    .frame(width: proxy.size.height * 16 / 9, height: proxy.size.height)
                    .position(x: proxy.size.width / 2, y: proxy.size.height / 2)
                    .onAppear() {
                        queuePlayer.isMuted = true
                        self.playerLooper = AVPlayerLooper(player: self.queuePlayer, templateItem: self.playerItem)
                        queuePlayer.play()
                    }
            }
            .clipped()
            

            GeometryReader { geo in
                ScrollView(.vertical, showsIndicators: false) {

                    VStack {
                        Spacer()

                        Button(action: {
                            print("Start Surrvey")
                            basicSurveyVM.startSurveyBtnClick()
                        }, label: {
                            Text("START")
                                .modifier(BtnText(enabled: $nextBtnEnabled))
                        })
                        .padding(.horizontal, 45)

                        Spacer()
                            .frame(height: 30)

                        HaveAccountView()
                            .padding(.bottom, 55)

                    }
                    .frame(
                        minWidth: geo.size.width,
                        minHeight: geo.size.height
                    )

                }
            }
            
            VStack {
                topRightLanuageBtn
                Spacer()
            }
            
        }
        
        
    }
    
    var topRightLanuageBtn: some View {
        HStack {
            Spacer()
            Button {
                print("Change Language")
            } label: {
                Text("EN")
                    .font(.title2)
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
                    .opacity(0.5)
                    .padding(.trailing, 30)
                    .padding(.top, 25)
            }
        }
    }
    
}

struct AVPlayerControllerRepresented : UIViewControllerRepresentable {
    var player : AVPlayer
    
    func makeUIViewController(context: Context) -> AVPlayerViewController {
        let controller = AVPlayerViewController()
        controller.player = player
        controller.showsPlaybackControls = false
        return controller
    }
    
    func updateUIViewController(_ uiViewController: AVPlayerViewController, context: Context) {
        
    }
}

struct SurveyFirstOnboardingScreen_Previews: PreviewProvider {
    static var previews: some View {
        SurveyFirstOnboardingScreen()
    }
}

