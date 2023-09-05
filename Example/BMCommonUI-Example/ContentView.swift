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
    BMCLoginFakeProgressView(duration: 3)
  }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
