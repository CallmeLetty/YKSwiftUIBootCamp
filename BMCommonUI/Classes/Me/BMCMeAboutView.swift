//
//  BMCMeAboutView.swift
//  BMCommonUI
//
//  Created by lollitech on 2023/7/23.
//

import SwiftUI

public typealias BMCMeAboutViewCellHandler = ((Int) -> ())?

public class BMCMeAboutViewCellModel: Identifiable{
  let title: String
  var cellHandler: BMCMeAboutViewCellHandler
  
  init(title: String,
       cellHandler: BMCMeAboutViewCellHandler) {
    self.title = title
    self.cellHandler = cellHandler
  }
}

public struct BMCMeAboutView: View {
  public var body: some View {
    NavigationView{
      ZStack {

        VStack {
          VStack(spacing: 30) {
            if let img = logoImage {
              Image(uiImage: img)
            }
            
            VStack(spacing: 10) {
              Text("App Name")
                .font(.title)
              Text("Version: 1.0.0")
                .font(.headline)
                .foregroundColor(.gray)
            }
          }
          
          
          List(tableData) { model in
            NavigationLink(model.title,
                           destination: Text(model.title))
          }
          .background(Color.clear)
          .frame(maxHeight: singleCellHeight * CGFloat(tableData.count))

        }
        
        VStack {
          Text("About")
            .font(.title)
            .bold()
            .padding(.horizontal,30)
          
          Spacer()
          
          Text("Bangtang Technology Co., Ltd Copyright @ 2022 Bangtang All Rights Reserved")
            .multilineTextAlignment(.center)
            .foregroundColor(.gray)
            .font(.subheadline)
            .padding(.horizontal,30)
        }
      }
    }
  }
  
  // MARK: - ui
  private let title: String
  private let singleCellHeight: CGFloat = 64
  private let version: String
  private let logoImage: UIImage?
  private let tableData: [BMCMeAboutViewCellModel]
  
  public init(title: String,
              version: String,
              logoImage: UIImage?,
              tableData: [BMCMeAboutViewCellModel]) {
    self.title = title
    self.version = version
    self.logoImage = logoImage
    self.tableData = tableData
  }
}

struct BMCMeAboutView_Previews: PreviewProvider {
  static var previews: some View {
    let model1 = BMCMeAboutViewCellModel(title: "Upload Logs") {index in
      print(index)
    }
    
    let model2 = BMCMeAboutViewCellModel(title: "Rate Now") {index in
      print(index)
    }
    
    BMCMeAboutView(title: "Focus",
                   version: "1.0.0",
                   logoImage: UIImage(named: "me_about_logo", in: BMCBundle.bundle(), with: nil),
                   tableData: [model1, model2])
  }
}
