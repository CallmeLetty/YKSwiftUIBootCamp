//
//  BMCPageListView.swift
//  BMCommonUI
//
//  Created by lollitech on 2023/8/25.
//

import SwiftUI

struct BMCPageListView<Content> : View where Content : View {
  
  
  @State var viewSpacing: CGFloat = 0
  @State var viewSize = CGSize(width: Frame.SCREEN_WIDTH,
                               height: Frame.SCREEN_HEIGHT)
  @State var selection: Int = 0 {
    didSet {
      print(selection)
    }
  }
  
  var viewList: [Content]
  var scrollAction: ((Int, Content) -> Void)
  var body: some View {
    TabView(selection: $selection) {
          ForEach(0 ..< viewList.count,id: \.self) { index in
            viewList[index]
              .onDisappear {
                scrollAction(index, viewList[index])
              }

          }
    }
    .tabViewStyle(.page)
    .edgesIgnoringSafeArea(.all)
  }
  
//  public func onScrollToIndex(perform action: ((Int, Content) -> Void)? = nil) -> BMCPageListView {
//    action?(selection, viewList[selection])
//    return self
//  }
}

struct BMCPageListView_Previews: PreviewProvider {
  static var previews: some View {
    BMCPageListView(viewList: [
      RoundedRectangle(cornerRadius: 10)
        .foregroundColor(Color.black)
        .edgesIgnoringSafeArea(.all),
      RoundedRectangle(cornerRadius: 10)
        .foregroundColor(Color.pink)
        .edgesIgnoringSafeArea(.all),
      RoundedRectangle(cornerRadius: 10)
        .foregroundColor(Color.gray)
        .edgesIgnoringSafeArea(.all)]) { index, v in
          print("onScrollToIndex \(index)")
        }
  }
}

