//
//  BMCDialogueView.swift
//  BMCommonUI
//
//  Created by DoubleCircle on 2023/9/1.
//

import SwiftUI

public struct BMCDialogueView: View {
  @State public var isPresented: Bool
  @State public var title: String
  
  public let insideView: AnyView
  
  public init(isPresented: Bool,
              title: String,
              insideView: AnyView) {
    self.isPresented = isPresented
    self.title = title
    self.insideView = insideView
  }

  private let hPadding: CGFloat = 16

  public var body: some View {
      ZStack {
        Color(hex: 0x161C44)
          .edgesIgnoringSafeArea(.all)
        
        VStack {
          HStack {
            Button("Cancel") {
              isPresented.toggle()
            }.padding(.horizontal, hPadding)
            
            Spacer()
            
            Text(title)
              .foregroundColor(BMCColor.title)
              .font(.system(size: 17))
            Spacer()
            
            Button("Done") {
              isPresented.toggle()
            }.padding(.horizontal, hPadding)
          }
          .frame(height: 56)
          
          insideView
        }
        .background(BMCColor.normalBg)
        .edgesIgnoringSafeArea(.all)
      }
    }
}

struct BMCDialogueViewDemo: View {
  @State var show = true
  
  var body: some View {
    Button("Show Dialogue") {
      show.toggle()
    }
    .sheet(isPresented: $show) {
      BMCDialogueView(isPresented: show,
                      title: "Detail",
                      insideView: AnyView(BMCMeReminderDetailView(title: "",
                                                                  detail: "",
                                                                  date: Date(),
                                                                  repeatType: .never)))
    }
  }
}

struct BMCDialogueView_Previews: PreviewProvider {
    static var previews: some View {
      BMCDialogueViewDemo()
    }
}
