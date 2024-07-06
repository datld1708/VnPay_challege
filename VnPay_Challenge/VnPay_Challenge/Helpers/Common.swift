//
//  Common.swift
//  VnPay_Challenge_Pokemon
//
//  Created by VCCORP on 5/7/24.
//

import Foundation
import UIKit

class Common {
    class func calculateTextWidth(_ text: String, font: UIFont, height: CGFloat) -> CGFloat {
        let lb = UILabel(frame: CGRect(x: 0, y: 0, width: CGFloat.greatestFiniteMagnitude, height: height))
        lb.numberOfLines = 0
        lb.text = text
        lb.font = font
        lb.sizeToFit()
        return lb.frame.size.width
    }
    
    class func heightOfLabel(text: String, font: UIFont, maxWidth: CGFloat, lines: Int = 0) -> CGFloat {
        let label: UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: maxWidth, height: CGFloat.greatestFiniteMagnitude))
        label.numberOfLines = lines
        label.lineBreakMode = NSLineBreakMode.byTruncatingTail
        label.text = text
        label.font = font
        label.sizeToFit()
        return label.frame.height
    }
    
//    func loadImg(url: String) -> Data? {
//        if let url = URL(string: url) {
//            URLSession.shared.dataTask(with: url) { data, response, error in
//                return data
//            }.resume()
//        }
//        return nil
//    }

}
