//
//  BMCMeReminderDetailView.swift
//  BMCommonUI
//
//  Created by DoubleCircle on 2023/9/1.
//

import SwiftUI

struct BMCMeReminderDetailView: View {
  
  @State var title: String
  @State var detail: String
  @State var date: Date
  @State var repeatType: String
  
  private let hPadding: CGFloat = 16
  
    var body: some View {
      ScrollView(.vertical) {
        VStack {
            HStack {
              Text("Title")
                .foregroundColor(Color(hex: 0xDDE7FF))
                .font(.system(size: 17))
                .padding(.leading, 12 + hPadding)
                .padding(.trailing, 12)
              Spacer()
              Button {
                // fold title
              } label: {
                Image.BMC("fold_down")
              }
              .padding(.trailing, 12 + hPadding)

            }.frame(height: 52)
          
          Path{ path in
            path.move(to: CGPoint(x:Frame.SCREEN_WIDTH - (hPadding+11) * 2, y:0))
            path.addLine(to: CGPoint(x:11, y:0))
          }
          .stroke(Color.white.opacity(0.1), lineWidth:0.5)
          
          TextEditor(text: $detail)
            .background(Color.gray.opacity(0.3))
            .foregroundColor(Color(hex: 0xDDE7FF))
            .font(.system(size: 17))
              .padding(.horizontal, 12)
              .multilineTextAlignment(.leading)
          }
          .padding(.horizontal,hPadding)
          .background(
            RoundedRectangle(cornerRadius: 12)
              .fill(Color(hex: 0x213358))
              .frame(width: Frame.SCREEN_WIDTH - hPadding * 2)
              .cornerRadius(12)
        )
        
        VStack {
          HStack {
            Text("Set Reminder")
              .foregroundColor(Color(hex: 0xDDE7FF))
              .font(.system(size: 17))
              .padding(.leading, 12 + hPadding)
              .padding(.trailing, 12)
            Spacer()
            
          }.frame(height: 52)
          
          Path{ path in
            path.move(to: CGPoint(x:Frame.SCREEN_WIDTH - (hPadding+11) * 2, y:0))
            path.addLine(to: CGPoint(x:11, y:0))
          }
          .stroke(Color.white.opacity(0.1), lineWidth:0.5)
          
            Text("Title")
            .foregroundColor(Color(hex: 0xDDE7FF))
        }
        .padding(.horizontal,hPadding)
        .background(
          RoundedRectangle(cornerRadius: 12)
            .fill(Color(hex: 0x213358))
            .frame(width: Frame.SCREEN_WIDTH - hPadding * 2)
            .cornerRadius(12)
          )
      }
    }
}

struct BMCMeReminderDetailView_Previews: PreviewProvider {
    static var previews: some View {
      BMCMeReminderDetailView(title: "",
                              detail: "",
                              date: Date(),
                              repeatType: "")
    }
}
