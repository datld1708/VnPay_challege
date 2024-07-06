//
//  Constants.swift
//  VnPay_Challenge_Pokemon
//
//  Created by VCCORP on 5/7/24.
//

import Foundation
import UIKit

struct Constants {
    
    struct ScreenSize {
        static let SCREEN_WIDTH         = UIScreen.main.bounds.size.width
        static let SCREEN_HEIGHT        = UIScreen.main.bounds.size.height
        static let SCREEN_MAX_LENGTH    = max(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
        static let SCREEN_MIN_LENGTH    = min(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
    }
    
    struct FontName {
        static let kFontSFProRegular = "SFProDisplay-Regular"
        static let kFontSFProDisplayBold = "SFProDisplay-Bold"
        static let kFontSFProDisplayMedium = "SFProDisplay-Medium"
        static let kFontSFProDisplaySemibold = "SFProDisplay-Semibold"
    }
}
