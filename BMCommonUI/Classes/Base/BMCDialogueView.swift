//
//  BMCDialogueView.swift
//  BMCommonUI
//
//  Created by DoubleCircle on 2023/9/1.
//

import SwiftUI

struct BMCDialogueView: View {
  @State var isPresented: Bool
  @State var title: String
  
  let insideView: AnyView

  private let hPadding: CGFloat = 16

    var body: some View {
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
              .foregroundColor(Color(hex: 0xDDE7FF))
              .font(.system(size: 17))
            Spacer()
            
            Button("Done") {
              isPresented.toggle()
            }.padding(.horizontal, hPadding)
          }
          .frame(height: 56)
          
          insideView
        }
        .background(Color.clear)
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
                                                                  repeatType: "")))
    }
  }
}

struct BMCDialogueView_Previews: PreviewProvider {
    static var previews: some View {
      BMCDialogueViewDemo()
    }
}
