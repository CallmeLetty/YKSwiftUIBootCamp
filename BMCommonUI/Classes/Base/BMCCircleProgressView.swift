//
//  BMCCircleProgressView.swift
//  BMCommonUI
//
//  Created by lollitech on 2023/9/4.
//

import SwiftUI

public enum BMCCircleProgressState {
  case during, done, failed
  
  var buttonText: String {
    switch self {
    case .during: return "Updating"
    case .done:   return "Done"
    case .failed: return "Try Again"
    }
  }
  
  var buttonBgColor: Color {
    switch self {
    case .during: return Color(hex: 0xC0C9D4)
    case .done:   return Color(hex: 0xF7599C)
    case .failed: return Color(hex: 0xF7599C)
    }
  }
  
  var circleBorderColor: Color {
    switch self {
    case .during: return Color(hex: 0xF2F4F8)
    case .done:   return Color(hex: 0xFF5C5C)
    case .failed: return Color(hex: 0xFF5C5C).opacity(0.35)
    }
  }
  
  var circleBgColor: Color {
    switch self {
    case .during: return Color(hex: 0xF2F4F8)
    case .done:   return Color(hex: 0xFF5C5C)
    case .failed: return Color(hex: 0xFFFBFB)
    }
  }
}

struct BMCCircleProgressView: View {
  // 0-100
  @State var progress: Float = 0.0
  @State var state: BMCCircleProgressState
  
  let updateInfoList = [
    "Updated the accuracy of the ring temperature upload",
    "Updated the page prompts to improve the user experience"
  ]
  
  var body: some View {
    VStack {
      ZStack {
        // circle
//        Circle()
//          .stroke(state.circleBorderColor, style: .init(lineWidth: 6.5))
//          .frame(width: 143.5)
        
        if state == .failed {
          BMCCircleProgressFailView()
            .frame(width: 143.5)
        } else {
          PreogressView(progressValue: $progress)
              .frame(width: 143.5)
          // Text
          Text("\(Int(progress * 100))%")
        }
      }
      .padding(.top, 114)
      .padding(.bottom, 47)
      
      Text("New updates in this version:")
        .bold()
        .font(.system(size: 18))
        .foregroundColor(Color(hex: 0x1A111F))
        .padding(.bottom, 20)
      
      ForEach(0..<updateInfoList.count,id:\.self) { index in
        HStack {
          Image.BMC("me_about_logo")?
            .resizable()
            .scaledToFit()
            .frame(width: 20, height: 20)
            .padding(.trailing, 20)
          
          Text(updateInfoList[index])
            .foregroundColor(Color(hex: 0x8C8D92))
            .font(.system(size: 13))
            .fontWeight(.medium)
            .lineSpacing(4)
            
          Spacer()
        }
        .padding(.horizontal, 16)
        .padding(.bottom, 30)
      }
      
      Spacer()
      
      Button {
        print("Update done")
      } label: {
        Text(state.buttonText)
          .padding(.vertical, 12.5)
          .padding(.horizontal, 72.5)
          .background(state.buttonBgColor)
          .cornerRadius(22.5)
          .foregroundColor(.white)
          .font(.system(size: 14))
      }
      .padding(.bottom, 25)

    }
  }
}

struct BMCCircleProgressView_Previews: PreviewProvider {
    static var previews: some View {
      BMCCircleProgressView(progress: 0,state: .failed)
    }
}

//进度条view
struct PreogressView : View {
  
  @Binding var progressValue: Float
  var color: Color = .blue
  var circleBorderWidth: CGFloat = 6.5
  
  var body: some View {
    ZStack {
      Circle()
        .stroke(lineWidth: circleBorderWidth)
        .opacity(0.2)
        .foregroundColor(.secondary)
      
      Circle()
        .trim(from: 0.0, to: CGFloat(min(progressValue, 1.0)))
        .stroke(style: StrokeStyle(lineWidth: circleBorderWidth, lineCap: .round, lineJoin: .round, miterLimit: 0.4))
        .foregroundColor(color)
      //旋转使其从顶部开始
        .rotationEffect(Angle(degrees: 270))
        .animation(.easeInOut,value: progressValue)
      
    }
  }
}

struct BMCCircleProgressFailView : View {
  var body: some View {
    ZStack {
      Circle()
        .stroke(BMCCircleProgressState.failed.circleBorderColor,
                style: .init(lineWidth: 6.5))
        .foregroundColor(BMCCircleProgressState.failed.circleBgColor)
        
    }
  }
}
