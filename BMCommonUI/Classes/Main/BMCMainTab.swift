//
//  BMCLoginChooseView.swift
//  BMCommonUI
//
//  Created by lollitech on 2023/8/16.
//

import SwiftUI

struct BMCMainTabSingleVM {
  var title: String
  var normalImage: Image?
  var selectedImage: Image?
  var view: AnyView
}

struct BMCMainTab: View {
  @Environment(\.colorScheme) var scheme
  @State var selectedTab: Int = 0
  var viewList: [BMCMainTabSingleVM]
  
  init(viewList: [BMCMainTabSingleVM]) {
    self.viewList = viewList
    
    switch scheme {
    case .light:
      UITabBar.appearance().backgroundColor = .white
      UITabBar.appearance().unselectedItemTintColor = UIColor(hexString: "#4C5A6E")
    case .dark:
      UITabBar.appearance().backgroundColor = UIColor(hexString: "#231E25")
      UITabBar.appearance().unselectedItemTintColor = UIColor(hexString: "#C7C1CA")
    @unknown default:
      UITabBar.appearance().backgroundColor = .white
    }
  }
  
  var body: some View {
    TabView(selection: $selectedTab) {
      ForEach(viewList.indices, id: \.self) { index in
        let vm = viewList[index]
        vm.view.tabItem {
          let selected = selectedTab == index
          selected ? vm.selectedImage : vm.normalImage
          Text(vm.title)
        }
      }
    }
    .accentColor(Color(hex: 0xF7599C))
  }
}

struct BMCMainTab_Previews: PreviewProvider {
  static var previews: some View {
    BMCMainTab(viewList: [
      BMCMainTabSingleVM(title: "Today",
                         normalImage: Image.BMC("tab_item_btn_01_nor"),
                         selectedImage: Image.BMC("tab_item_btn_01_sel"),
                         view: AnyView(Text("Today"))),
      BMCMainTabSingleVM(title: "Calendar",
                         normalImage: Image.BMC("tab_item_btn_02_nor"),
                         selectedImage: Image.BMC("tab_item_btn_02_sel"),
                         view: AnyView(Text("Calendar"))),
      BMCMainTabSingleVM(title: "Analysis",
                         normalImage: Image.BMC("tab_item_btn_03_nor"),
                         selectedImage: Image.BMC("tab_item_btn_03_sel"),
                         view: AnyView(BMCMeMainView())),
      BMCMainTabSingleVM(title: "Content",
                         normalImage: Image.BMC("tab_item_btn_04_nor"),
                         selectedImage: Image.BMC("tab_item_btn_04_sel"),
                         view: AnyView(BMCMeMainView())),
      BMCMainTabSingleVM(title: "Shop",
                         normalImage: Image.BMC("tab_item_btn_shop_nor"),
                         selectedImage: Image.BMC("tab_item_btn_shop_sel"),
                         view: AnyView(BMCMeMainView()))
    ])
  }
}

