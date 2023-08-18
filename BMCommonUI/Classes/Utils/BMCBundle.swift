//
//  BMCommonUI.h
//  BMCommonUI
//
//  Created by lollitech on 2023/7/22.
//

@objc public class BMCBundle: NSObject {
  static func bundle() -> Bundle {
//    NSString *path = [[NSBundle bundleForClass:[BMBWUIStyle class]] pathForResource:@"BMBaseWidgetLib" ofType:@"bundle"];
//    self.mainBundle = [NSBundle bundleWithPath:path];
    guard let path = Bundle(for: self).path(forResource: "BMCommonUI", ofType: "bundle"),
    let bundle = Bundle(path: path) else {
      return Bundle(for: self)
    }
    return bundle
  }
}
