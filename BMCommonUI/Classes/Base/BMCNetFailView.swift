//
//  BMCEmptyStatusView.swift
//  BMCommonUI
//
//  Created by DoubleCircle on 2023/9/8.
//

import SwiftUI

struct BMCNetFailView: View {
  @Binding var showNetFail: Bool
  var text: String = "No Internet Connection.Please reconnect."
  var buttonText: String = "Retry"
  var action: (() -> Void)?
  
  var body: some View {
    VStack {
      
      Image.BMC("empty_pic_no_internet")
        .padding(.bottom, 20)
      
      Text(text)
        .font(.subheadline)
        .foregroundColor(.gray)
        .padding(.bottom, 30)
      
      Button {
        action?()
      } label: {
        Text(buttonText)
          .padding(.vertical, 12.5)
          .padding(.horizontal, 72.5)
          .foregroundColor(Color(hex: 0xF7599C))
          .font(.system(size: 14))
      }
      .overlay(
          RoundedRectangle(cornerRadius: 20, style: .continuous)
               .stroke(Color(hex: 0xF7599C), lineWidth: 2)
                  
      )
    }
  }
}

struct BMCNetFailViewDemo: View {
  @State var showNetFail = true
  var body: some View {
    BMCNetFailView(showNetFail: $showNetFail)
  }
}

struct BMCEmptyStatusView_Previews: PreviewProvider {
  static var previews: some View {
    BMCNetFailViewDemo()
  }
}
