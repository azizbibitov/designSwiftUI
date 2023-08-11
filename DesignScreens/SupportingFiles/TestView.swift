//
//  TestView.swift
//  DesignScreens
//
//  Created by Aziz's MacBook Air on 11.08.2023.
//

import SwiftUI

import SwiftUI

struct CrossEffectDemo: View {
    let animationDuration: Double = 2
    let images = ["image1", "image2", "image3", "image4"]
    @State private var idx = 0
    @State private var transitionType: Int = 2
    
    var transition: AnyTransition {
        if transitionType == 0 {
            return .opacity
        } else if transitionType == 1 {
            return .scale
        } else if transitionType == 2 {
            return .circular
        } else if transitionType == 3 {
                return .rectangular
        } else if transitionType == 4 {
            return .stripes(stripes: 50, horizontal: true)
        } else if transitionType == 5 {
            return .stripes(stripes: 50, horizontal: false)
        } else {
            return .opacity
        }
    }
    
    var body: some View {
        VStack {
            Text("Picture Show").padding(.bottom, 0)
            
            ZStack {
                ForEach(self.images.indices) { i in
                    if self.idx == i {
                        Image(self.images[i]).photoStyle(height: 530)
                            .transition(self.transition)
                    }
                }
                
            }
            
            Picker(selection: self.$transitionType, label: EmptyView()) {
                Text(".opacity").tag(0)
                Text(".scale").tag(1)
                Text(".circular").tag(2)
                Text(".rectangular").tag(3)
                Text(".stripes(H)").tag(4)
                Text(".stripes(V)").tag(5)
            }.pickerStyle(SegmentedPickerStyle()).frame(width: 800)
                .padding(.top, 20)
            
            HStack(spacing: 20) {
                Button(action: {
                    withAnimation(.easeInOut(duration: self.animationDuration)) {
                        self.idx = self.idx > 0 ? self.idx - 1 : self.images.count - 1
                    }
                }) {
                    Image(systemName: "arrow.left.circle.fill")
                }
                
                Button(action: {
                    withAnimation(.easeInOut(duration: self.animationDuration)) {
                        self.idx = self.idx < (self.images.count - 1) ? self.idx + 1 : 0
                    }
                }) {
                    Image(systemName: "arrow.right.circle.fill")
                }
            }.padding(.top, 20)
            
        }.font(.largeTitle)
    }
}

extension Image {
    func photoStyle(height: CGFloat) -> some View {
        let shape = RoundedRectangle(cornerRadius: 15)
        
        return self.resizable()
            .aspectRatio(contentMode: .fit)
            .frame(height: height)
            .clipShape(shape)
            .overlay(shape.stroke(Color.white, lineWidth: 2))
            .padding(2)
            .overlay(shape.strokeBorder(Color.black.opacity(0.1)))
            .shadow(radius: 2)
            .padding(4)
    }
}

extension AnyTransition {
    static var rectangular: AnyTransition { get {
        AnyTransition.modifier(
            active: ShapeClipModifier(shape: RectangularShape(pct: 1)),
            identity: ShapeClipModifier(shape: RectangularShape(pct: 0)))
        }
    }
    
    static var circular: AnyTransition { get {
        AnyTransition.modifier(
            active: ShapeClipModifier(shape: CircleClipShape(pct: 1)),
            identity: ShapeClipModifier(shape: CircleClipShape(pct: 0)))
        }
    }
    
    static func stripes(stripes s: Int, horizontal h: Bool) -> AnyTransition {
        
        return AnyTransition.asymmetric(
            insertion: AnyTransition.modifier(
                active: ShapeClipModifier(shape: StripesShape(insertion: true, pct: 1, stripes: s, horizontal: h)),
                identity: ShapeClipModifier(shape: StripesShape(insertion: true, pct: 0, stripes: s, horizontal: h))),
            removal: AnyTransition.modifier(
                active: ShapeClipModifier(shape: StripesShape(insertion: false, pct: 1, stripes: s, horizontal: h)),
                identity: ShapeClipModifier(shape: StripesShape(insertion: false, pct: 0, stripes: s, horizontal: h))))
    }
    
}

struct ShapeClipModifier<S: Shape>: ViewModifier {
    let shape: S
    
    func body(content: Content) -> some View {
        content.clipShape(shape)
    }
}

struct RectangularShape: Shape {
    var pct: CGFloat
    
    var animatableData: CGFloat {
        get { pct }
        set { pct = newValue }
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.addRect(rect.insetBy(dx: pct * rect.width / 2.0, dy: pct * rect.height / 2.0))
        
        return path
    }
}

struct StripesShape: Shape {
    let insertion: Bool
    var pct: CGFloat
    let stripes: Int
    let horizontal: Bool
    
    var animatableData: CGFloat {
        get { pct }
        set { pct = newValue }
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()

        if horizontal {
            let stripeHeight = rect.height / CGFloat(stripes)
            
            for i in 0..<(stripes) {
                let j = CGFloat(i)

                if insertion {
                    path.addRect(CGRect(x: 0, y: j * stripeHeight, width: rect.width, height: stripeHeight * (1-pct)))
                } else {
                    path.addRect(CGRect(x: 0, y: j * stripeHeight + (stripeHeight * pct), width: rect.width, height: stripeHeight * (1-pct)))
                }
            }
        } else {
            let stripeWidth = rect.width / CGFloat(stripes)
            
            for i in 0..<(stripes) {
                let j = CGFloat(i)

                if insertion {
                    path.addRect(CGRect(x: j * stripeWidth, y: 0, width: stripeWidth * (1-pct), height: rect.height))
                } else {
                    path.addRect(CGRect(x: j * stripeWidth + (stripeWidth * pct), y: 0, width: stripeWidth * (1-pct), height: rect.height))
                }
            }
        }
        
        return path
    }
}

struct CircleClipShape: Shape {
    var pct: CGFloat

    var animatableData: CGFloat {
        get { pct }
        set { pct = newValue }
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        var bigRect = rect
        bigRect.size.width = bigRect.size.width * 2 * (1-pct)
        bigRect.size.height = bigRect.size.height * 2 * (1-pct)
        bigRect = bigRect.offsetBy(dx: -rect.width/2.0, dy: -rect.height/2.0)

        path = Circle().path(in: bigRect)
        
        return path
    }
}

//struct TestView_Previews: PreviewProvider {
//    static var previews: some View {
//        TestView()
//    }
//}
