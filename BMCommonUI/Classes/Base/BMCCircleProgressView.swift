//
//  BMCCircleProgressView.swift
//  BMCommonUI
//
//  Created by lollitech on 2023/9/4.
//

import SwiftUI

public enum BMCCircleProgressState {
  case during, done
  
  var desc: String {
    switch self {
    case .during: return "Updating"
    case .done:   return "Done"
    }
  }
  
  var bgColor: Color {
    switch self {
    case .during: return Color(hex: 0xC0C9D4)
    case .done:   return Color.pink
    }
  }
}

struct BMCCircleProgressView: View {
  // 0-100
  @State var progress: Int
  @State var state: BMCCircleProgressState
  
  let updateInfoList = [
    "Updated the accuracy of the ring temperature upload",
    "Updated the page prompts to improve the user experience"
  ]
  
  var body: some View {
    VStack {
      ZStack {
        // circle
        Circle()
          .border(Color(hex: 0xF2F4F8), width: 6.5)
        // Text
        Text("\(progress)")
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
          Text(updateInfoList[index])
            .foregroundColor(Color(hex: 0x8C8D92))
            .font(.system(size: 13))
        }
        .padding(.horizontal, 16)
        .padding(.bottom, 30)
      }
      
      
      Spacer()
      
      Button {
        print("Update done")
      } label: {
        Text(state.desc)
          .padding(.vertical, 12.5)
          .padding(.horizontal, 72.5)
          .background(state.bgColor)
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
      BMCCircleProgressView(progress: 0,state: .during)
    }
}
