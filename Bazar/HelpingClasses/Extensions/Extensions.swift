//
//  Extensions.swift
//  Bazar
//
//  Created by Naveed Khalid on 22/01/2025.
//

import UIKit
import Foundation

enum AssetsFont: String {
    case openSansBold = "OpenSans-Bold"
    case robotoRegular = "Roboto-Regular"
    case RobotoLight = "Roboto-Light"
    case RobotoMedium = "Roboto-Medium"
    case RobotoBold = "Roboto-Bold"
    case RobotoBoldItalic = "Roboto-BoldItalic"
    case RobotoCondensed = "Roboto-Condensed"
    case RobotoBoldCondensed = "Roboto-BoldCondensed"
}

extension UIFont {
    static func appFont(_ name: AssetsFont, size: CGFloat) -> UIFont? {
        return UIFont(name: name.rawValue, size: size)
    }
}

enum AssetsColor: String {
    case purple
    case black
    case grey
    case lightGrey
}

extension UIColor {
    static func appColor(_ name: AssetsColor) -> UIColor? {
        return UIColor(named: name.rawValue)
    }
}





// Code for screen Height and screen Type regarding different screens


public extension UIDevice {
    
    var iPhone: Bool { UIDevice.current.userInterfaceIdiom == .phone }
    var iPad: Bool { UIDevice().userInterfaceIdiom == .pad }

    enum ScreenType: String {
        case iphone_8 = "iPhone 8"
        case iphone_8Plus = "iPhone 8 Plus"
        case iphone_SE3 = "iPhone SE (3rd generation)"
        case iphone_X_XS = "iPhone X or iPhone XS"
        case iphone_XR_11 = "iPhone XR or iPhone 11"
        case iphone_XSMax_ProMax = "iPhone XS Max or iPhone 11 Pro Max or iPhone 12 Pro Max or iPhone 13 Pro Max or iPhone 14 Plus"
        case iphone_11Pro = "iPhone 11 Pro"
        case iphone_12_12Pro_13_13Pro_14 = "iPhone 12 or 12 Pro or 13 or 13 Pro or 14"
        case iphone_14Pro = "iPhone 14 Pro"
        case iphone_14ProMax = "iPhone 14 Pro Max"
        case iphone12Mini_13Mini = "iPhone 12 Mini or 13 Mini"
        case unknown
    }

    
    
    var screenHeight: CGFloat {
        return UIScreen.main.bounds.height
    }

    var screenType: ScreenType {
        guard iPhone else { return .unknown }
        
        switch screenHeight {
        case 667:  // iPhone 8, iPhone 7, iPhone 6s, iPhone 6,iPhone SE
            return .iphone_8
        case 736:  // iPhone 8 Plus, iPhone 7 Plus, iPhone 6s Plus, iPhone 6 Plus
            return .iphone_8Plus
        case 734:  // iPhone SE (3rd generation)
            return .iphone_SE3
        case 812:  // iPhone X, XS, 11 Pro
            return .iphone_X_XS
        case 896:  // iPhone XR, 11
            return .iphone_XR_11
        case 844:  // iPhone 12, 12 Pro, 13, 13 Pro, 14
            return .iphone_12_12Pro_13_13Pro_14
        case 2532:  // iPhone 14 Pro
            return .iphone_14Pro
        case 2796:  // iPhone 14 Pro Max
            return .iphone_14ProMax
        case 2340:  // iPhone 12 Mini, 13 Mini
            return .iphone12Mini_13Mini
        default:
            return .unknown
        }
    }
}


