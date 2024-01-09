//
//  File.swift
//  
//
//  Created by Nato Egnatashvili on 29.12.23.
//

import SwiftUI


public struct TwoButtonWaveAnimation: View {
    public init(factor: Double = 0.0) {
        self.factor = factor
    }
    
    @State var factor: Double = 0.0
    
    public var body: some View {
        VStack {
            HStack {
                Button("Login") {
                    print("login")
                }
                Button("Sign Up") {
                    print("login")
                }
                
            }
            WaveViewTest()
                .animation(Animation.easeInOut(duration: 2.0).repeatForever(autoreverses: true))
                .frame(height: 100)
            Color(.black)
                .frame(height: 50)
        }
    }
}

struct WaveViewTest: View {
    var body: some View {
        GeometryReader { geometry in
            Path { path in
                let width = geometry.size.width
                let height = geometry.size.height
                let midY = height / 2
                
                path.move(to: CGPoint(x: 0, y: midY))
                //                let y = midY + sin(2 * 0.05) * 20
                //                path.addLine(to: CGPoint(x: 2, y: y))
                for x in stride(from: 0, through: width, by: 5) {
                    let y = midY + sin(x * 0.02) * 40
                    path.addLine(to: CGPoint(x: x, y: y))
                }
                path.addLine(to: CGPoint(x: width, y: midY))
            }
            .fill(Color.blue)
        }
    }
    
    var animation: Animation {
        Animation.linear(duration: 3).repeatForever(autoreverses: false)
    }
}

struct WaveView: View {
    var body: some View {
        GeometryReader { geometry in
            Path { path in
                let width = geometry.size.width
                let height = geometry.size.height
                let midY = height / 2
                
                path.move(to: CGPoint(x: 0, y: midY))
                
                for x in stride(from: 0, through: width, by: 5) {
                    let y = midY + sin(x * 0.05) * 20
                    path.addLine(to: CGPoint(x: x, y: y))
                }
                
                path.addLine(to: CGPoint(x: width, y: midY))
            }
            .fill(Color.blue)
        }
    }
}

struct TwoButtonWaveAnimation_Previews: PreviewProvider {
    static var previews: some View {
        TwoButtonWaveAnimation()
    }
}

