//
//  BMCLoginWelcomeView.swift
//  BMCommonUI
//
//  Created by DoubleCircle on 2023/8/25.
//

import SwiftUI

struct BMCLoginWelcomeView: View {
  let sources: [(String, String)] = [
    ("landingpage_img1", "Manage your ADHD in 5 minutes a day"),
    ("landingpage_img2","Develop new habits and build lifelong skills"),
    ("landingpage_img3","Short daily exercises that integrate into your life")
  ]
  var body: some View {
    
    ZStack {
      ScrollView(.horizontal, showsIndicators: false) {
        HStack(spacing: 0) {
          ForEach(0 ..< sources.count,id:\.self) { index in
            let source = sources[index]
            BMCLoginWelcomeSinglePage(bgImageName: source.0,
                                      title: source.1,
                                      index: index)
          }
        }
        
      }
      .edgesIgnoringSafeArea(.top)
      
      
      
      VStack {
        Spacer(minLength: 549 * Frame.scale)
        
        Button {
          print("Get Started")
          print(Frame.scale)
        } label: {
          Text("Get Started")
            .font(.system(size: 16))
            .bold()
            .foregroundColor(Color(hex: 0x131C41))
            .frame(width: Frame.SCREEN_WIDTH - 27 * 2,
                   height: 58)
            .background(Color(hex: 0x83D6FF))
            .cornerRadius(29)
        }
        
        Button {
          print("Get Started")
          print(Frame.scale)
        } label: {
          Text("login")
            .font(.system(size: 16))
            .underline()
            .foregroundColor(.white)
        }
        .padding(.top, 16)
        Spacer()
      }
    }
    
  }
}

struct BMCLoginWelcomeSinglePage: View {
  let bgImageName: String
  let title: String
  let index: Int
  
  var body: some View {
    ZStack {
      Image.BMC(bgImageName)?
        .resizable()
        .frame(width: Frame.SCREEN_WIDTH, height: Frame.SCREEN_HEIGHT, alignment: .center)
      
      VStack {
        Spacer(minLength: 399 * Frame.scale)
        Text(title)
          .bold()
          .font(.title)
          .foregroundColor(.white)
          .frame(width: Frame.SCREEN_WIDTH - 40,alignment: .center)
        
        BMCPageControl(currentPage: CGFloat(index),
                       pageCount: 3,
                       tintColor: .white,
                       normalColor: .gray)
        .frame(height: 30)
        Spacer()
        
      }
      .frame(height: Frame.SCREEN_HEIGHT - 118)
    }
  }
}

struct BMCLoginWelcomeView_Previews: PreviewProvider {
  static var previews: some View {
    BMCLoginWelcomeView()
  }
}
