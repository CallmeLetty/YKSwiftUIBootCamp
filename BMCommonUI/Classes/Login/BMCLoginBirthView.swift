//
//  BMCMeAboutView.swift
//  BMCommonUI
//
//  Created by lollitech on 2023/7/23.
//

import SwiftUI

public struct BMCLoginBirthView: View {
  @State private var selectedDate = Date()
  @State private var continueEnable: Bool = false
  public var body: some View {
      ZStack {
          BMCLoginBgView()
          
          VStack(alignment: .leading) {
              Text("Enter birth year for better personalization")
                  .foregroundColor(.white)
                  .font(.title)
                  .bold()
                  .padding(.horizontal,20)
                  .padding(.bottom, 107)              
                DatePicker( selection: $selectedDate, displayedComponents: [.date]){}
                    .labelsHidden()
                .datePickerStyle(WheelDatePickerStyle())
                .foregroundColor(Color.white)
                .padding(.horizontal, 20)
          }
          
          VStack {
              Spacer()
              BMCLoginContinueButton(continueEnable: $continueEnable)
          }
      }
  }
}

struct BMCLoginNameView: View {
    @State var name: String = ""
    @State var continueEnable: Bool = false
    
    var body: some View {
        ZStack {
            BMCLoginBgView()
            
            VStack(alignment: .leading) {
                Text("Thank you for telling us a little bit about yourself. What would you like us to call you?")
                    .foregroundColor(.white)
                    .font(.title)
                    .bold()
                    .padding(.horizontal,20)
                    .padding(.bottom, 50)
                
                TextField("inputPlaceHolder", text: $name,onCommit: {
                    continueEnable = name.count > 0
                })
                    .foregroundColor(Color.white)
                    .frame(height: 60)
                    .background(Color(hex: 0x060F28))
                    .cornerRadius(10)
                    .padding(.horizontal, 20)
                    .frame(width: .infinity)
            }
            
            VStack {
                Spacer()
                BMCLoginContinueButton(continueEnable: $continueEnable)
            }
        }
    }
}

struct BMCLoginContinueButton: View {
    @Binding var continueEnable: Bool
    var body: some View {
        Button {
            if continueEnable {
                print("Continue")
            } else {
                print("Disabled")
            }
        } label: {
            Text("Continue")
                .foregroundColor(Color.black)
                .font(.headline)
        }
        .frame(width: 335,height: 58)
        .background(continueEnable ? Color(hex: 0x83D6FF) : Color.gray)
        .cornerRadius(29)
    }
}

struct BMCLoginBgView: View {
    var body: some View {
        ZStack(alignment: .top) {
        Color(hex:0x161C44)
          .edgesIgnoringSafeArea(.all)
            Image.BMC("register_bg_img")?
                .resizable()
                .frame(width: .infinity)
                .aspectRatio(contentMode: .fit)
              .edgesIgnoringSafeArea(.all)
      }
    }
}

struct BMCLoginBirthView_Previews: PreviewProvider {
  static var previews: some View {

    BMCLoginBirthView()
  }
}
