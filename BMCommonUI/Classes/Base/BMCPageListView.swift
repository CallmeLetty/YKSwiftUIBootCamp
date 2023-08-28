//
//  BMCPageListView.swift
//  BMCommonUI
//
//  Created by lollitech on 2023/8/25.
//

import SwiftUI

struct BMCPageListView<Content> : View where Content : View {
  var viewList: [Content]
  var scrollAction: ((Int, Content) -> Void)
  
  @State var viewSpacing: CGFloat = 0
  @State var viewSize = CGSize(width: Frame.SCREEN_WIDTH,
                               height: Frame.SCREEN_HEIGHT)
  @State private var selection: Int = 0
  
  var body: some View {
    TabView(selection: $selection) {
          ForEach(0 ..< viewList.count,id: \.self) { index in
            viewList[index]
              .onDisappear {
                scrollAction(selection, viewList[selection])
              }
          }
    }
    .tabViewStyle(.page)
    .edgesIgnoringSafeArea(.all)
  }
}

struct BMCPageListView_Previews: PreviewProvider {
  static var previews: some View {
    BMCPageListView(viewList: [
      RoundedRectangle(cornerRadius: 10)
        .foregroundColor(Color.black)
        .frame(width: 30,height: 100),
      RoundedRectangle(cornerRadius: 10)
        .foregroundColor(Color.pink)
        .frame(width: 30,height: 100),
      RoundedRectangle(cornerRadius: 10)
        .foregroundColor(Color.gray)
        .frame(width: 30,height: 100)]) { index, v in
          print("onScrollToIndex \(index)")
        }
  }
}

