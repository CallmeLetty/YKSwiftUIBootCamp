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
  
  var body: some View {
    TabView(selection: $selection) {
          ForEach(0 ..< viewList.count,id: \.self) { index in
            viewList[index]
              
          }
    }
    .tabViewStyle(.page)
  }
}

struct BMCPageListView_Previews: PreviewProvider {
  static var previews: some View {
      BMCPageListView(viewList: [
        Text("Hello, World111")
          .background(.purple)
          .edgesIgnoringSafeArea(.all),
        Text("Hello, World222")
          .background(.purple)
          .edgesIgnoringSafeArea(.all),
        Text("Hello, World333")
          .background(.purple)
          .edgesIgnoringSafeArea(.all)])
    }
}
