//
//  BMCPageControl.swift
//  BMCommonUI
//
//  Created by DoubleCircle on 2023/8/31.
//

import SwiftUI

struct BMCQuizIntroView: View {
  @Environment(\.presentationMode) var presentationMode
  var body: some View {
    ZStack {
      Image.BMC("quiz_bg_img")?
        .resizable(resizingMode: .stretch)
        .scaledToFill()
        .scaleEffect(Frame.scale)
        .edgesIgnoringSafeArea(.all)
      
      VStack {
        HStack {
          Button {
            presentationMode.wrappedValue.dismiss()
          } label: {
            Image.BMC("nav_darkback_icon")
          }
          .padding(.leading, 20)
          .padding(.top, 36)
          Spacer()
        }
        Spacer()
        
        Image.BMC("quiz_intro_icon")
        
        Text("The Adult ADHD Self-Report Scale (ASRS-v1.1) Symptom Checklist was developed in conjunction with the World Health Organization (WHO).")
          .bold()
          .padding(.horizontal, 20)
          .foregroundColor(Color(hex: 0xDDE7FF))
          .font(.title3)
          .lineSpacing(4)
          .padding(.bottom, 15)
          
        Text("It takes about 5 minutes to complete.")
          .padding(.horizontal, 25)
          .frame(width: Frame.SCREEN_WIDTH,alignment: .leading)
          .foregroundColor(Color(hex: 0xDDE7FF).opacity(0.6))
          .font(.subheadline)
        
        Spacer()
        
        Button {

        } label: {
            Text("Continue")
                .foregroundColor(Color.black)
                .font(.headline)
        }
        .frame(width: 335,height: 58)
        .background(Color(hex: 0x83D6FF))
        .cornerRadius(29)
        .padding(.bottom, 44)
      }
    }
  }
}

struct BMCQuizOptionsView: View {
  @Environment(\.presentationMode) var presentationMode

  
  var body: some View {
    ZStack {
      Image.BMC("quiz_bg_img")?
        .resizable(resizingMode: .stretch)
        .scaledToFill()
        .scaleEffect(Frame.scale)
        .edgesIgnoringSafeArea(.all)
      
      VStack(alignment: .leading) {
        HStack {
          Button {
            presentationMode.wrappedValue.dismiss()
          } label: {
            Image.BMC("nav_darkback_icon")
          }
          .padding(.leading, 20)
          .padding(.top, 36)
          .padding(.bottom, 24)
          Spacer()
        }
        
        Text("Question 1 of 12")
          .padding(.horizontal, 25)
          .foregroundColor(Color(hex: 0xDDE7FF).opacity(0.6))
          .font(.subheadline)
          .padding(.bottom, 16)
        
        Text("How often do you have trouble wrapping up the final details of a project, once the challenging parts have been done?")
          .bold()
          .padding(.horizontal, 20)
          .foregroundColor(Color(hex: 0xDDE7FF))
          .font(.title3)
          .lineSpacing(4)
          .padding(.bottom, 15)
        
        List(<#T##data: Binding<MutableCollection & RandomAccessCollection>##Binding<MutableCollection & RandomAccessCollection>#>, id: <#T##KeyPath<(MutableCollection & RandomAccessCollection).Element, Hashable>#>, rowContent: <#T##(Binding<(MutableCollection & RandomAccessCollection).Element>) -> View#>)
      }
      
    }
  }
}

struct BMCQuizIntroView_Previews: PreviewProvider {
  static var previews: some View {
    BMCQuizOptionsView()
    }
}
