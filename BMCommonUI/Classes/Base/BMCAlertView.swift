//
//  BMCAlertView.swift
//  BMCommonUI
//
//  Created by lollitech on 2023/8/16.
//

import SwiftUI

struct BMCAlertButtonVM {
  var text: String
  var isMain: Bool
  var action: (() -> ())?
}

struct BMCAlertVM {
  var title: String?
  var content: String?
  
  var buttonList: [BMCAlertButtonVM]?
}

struct BMCAlertView: View {
  let vm: BMCAlertVM
  
  var body: some View {
    ZStack {
      Color.black.opacity(0.58)
      BMCAlertContentView(vm: vm)
    }
    .edgesIgnoringSafeArea(.all)
  }
}

private struct BMCAlertContentView: View {
  @Environment(\.presentationMode) var presentationMode
  let vm: BMCAlertVM
  
  private let horizontalPadding: CGFloat = 40
  
  var body: some View {
    VStack() {
      HStack() {
        Spacer()
        Button {
          presentationMode.wrappedValue.dismiss()
        } label: {
          Image.BMC("btn_close_pop")
        }
        .padding(.trailing, horizontalPadding)
      }
      .padding(.bottom, 25)
      
      VStack {
        if let title = vm.title {
          Text(title)
            .padding(.top, 20)
            .padding(.bottom, 10)
        }
        
        if let content = vm.content {
          Text(content)
            .padding(.bottom, 27.5)
            .padding(.horizontal, 20.5 + horizontalPadding)
        }
        
        if let buttonList = vm.buttonList {
          ForEach(buttonList.indices, id:\.self) { index in
            let buttonVM = buttonList[index]
            Button {
              buttonVM.action?()
            } label: {
              Text(buttonVM.text)
                .font(.system(size: 14))
                .foregroundColor(buttonVM.isMain ? Color.white : Color(hex: 0x555253))
                .frame(width: Frame.SCREEN_WIDTH - horizontalPadding * 2 - 27.5 * 2)
                .frame(height: 36)
                .background(buttonVM.isMain ? Color(hex: 0xF7599C) : .white)
            }
            .border(buttonVM.isMain ? Color.clear : Color(hex: 0xC3CBD4), width: 0.5)
            .cornerRadius(18)
            .overlay (
                RoundedRectangle(cornerRadius: 18,style: .continuous)
                    .stroke(buttonVM.isMain ? Color.clear : Color(hex: 0xC3CBD4), lineWidth: 2)
            )
            .padding(.bottom, (index == buttonList.count - 1) ? 20 : 10)
          }
        }
      }
      .background(
        RoundedRectangle(cornerRadius: 15)
          .foregroundColor(Color.white)
          .padding(.horizontal, horizontalPadding)
      )
    }
  }
}


struct BMCAlertView_Previews: PreviewProvider {
  static var previews: some View {
    let vm =
    BMCAlertVM(title: "Title",
               content: "There seems to be some problems. You can choose to try again or sync the data next time. The unsynced data will be kept locally until it is successfully synced",
               buttonList: [
                BMCAlertButtonVM(text: "Try again",
                                 isMain: true,
                                 action: {
                                   print("Try again")
                                 }),
                BMCAlertButtonVM(text: "Update now",
                                 isMain: false,
                                 action: {
                                   print("Try again")
                                 })
               ])
    BMCAlertView(vm: vm)
  }
}
