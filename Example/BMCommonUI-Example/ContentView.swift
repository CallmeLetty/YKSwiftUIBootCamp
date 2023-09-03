//
//  ContentView.swift
//  BMCommonUI-Example
//
//  Created by lollitech on 2023/8/21.
//

import SwiftUI
import BMCommonUI

struct ContentView: View {
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
