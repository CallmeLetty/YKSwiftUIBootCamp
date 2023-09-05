//
//  BMCLoginProgressView.swift
//  BMCommonUI
//
//  Created by liuyuanyuan on 2023/8/19.
//

import SwiftUI

public struct BMCLoginFakeProgressView: View {
  @State public var animate: Bool = false
  public let duration: Double
  public init(duration: Double) {
    self.duration = duration
  }
  
  public var body: some View {
    
    ZStack {
      BMCLoginBgView()
      VStack {
        Image(systemName: "globe")
          .resizable()
          .imageScale(.large)
          .foregroundColor(Color(hex: 0x83D6FF))
          .frame(width: 100,height: 100)
        
        Text("Finding the best guided sessions to help you…")
          .foregroundColor(.white)
          .padding(.horizontal, 35)
          .font(.title)
          .lineSpacing(5)
          .padding(.bottom, 50)
        
        ZStack {
          RoundedRectangle(cornerRadius: 4.5, style: .circular)
            .frame(height: 9)
            .padding(.horizontal, 35)
            .foregroundColor(Color(hex: 0x1E3564))
          
          RoundedRectangle(cornerRadius: 4.5, style: .circular)
            .frame(width: Frame.SCREEN_WIDTH - 35 * 2, height: 9)
            .scaleEffect(CGSize(width: animate ? 1 : 0, height: 1.0), anchor: .leading)
            .animation(.easeIn(duration: duration), value: animate)
            .foregroundColor(Color(hex: 0x83D6FF))
        }
        HStack {
          Text("Preparing your plan….")
            .foregroundColor(.white.opacity(0.5))
            .padding(.horizontal, 35)
            .padding(.top, 12)
          Spacer()
        }
      }
    }
  }
  
  public func startAnimation() -> some View {
    animate.toggle()
    return self
  }
  
}

struct BMCLoginProgressView_Previews: PreviewProvider {
  static var previews: some View {
    BMCLoginFakeProgressView(duration: 3)
  }
}
