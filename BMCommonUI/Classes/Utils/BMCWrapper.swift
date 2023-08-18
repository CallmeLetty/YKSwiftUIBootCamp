//
//  BMCWrapper.swift
//  BMCommonUI
//
//  Created by lollitech on 2023/7/23.
//

import SwiftUI
import UIKit

@objc public class BMCWrapper: NSObject {
  
  @objc static public func aboutView() -> UIView {
    let model1 = BMCMeAboutViewCellModel(title: "Upload Logs") {index in
      print(index)
    }
    let aboutView = BMCMeAboutView(title: "Focus",
                                    version: "1.0.0",
                                    logoImage: UIImage(systemName: "global"),
                                    tableData: [model1])
    
    let swiftUIVC = UIHostingController(rootView: aboutView)
    return swiftUIVC.view
  }
  
}
