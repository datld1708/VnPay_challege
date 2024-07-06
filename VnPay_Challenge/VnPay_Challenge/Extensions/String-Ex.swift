//
//  String-Ex.swift
//  BaoThanhNien
//
//  Created by Nguyen Dang Tuan on 02/11/2022.
//

import Foundation
import UIKit

let DateFormat1 = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
let DateFormat2 = "yyyy-MM-dd'T'HH:mm:ss.SSS"
let DateFormat3 = "yyyy-MM-dd'T'HH:mm:ss"
let DateFormat4 = "yyyy-MM-dd'T'HH:mm:ss'Z'"
let DateFormat5 = "dd/MM/yyyy"
let DateFormat6 = "yyyy-MM-dd HH:mm:ss"

extension String {
    
    
    func convert360Attributedtext(lineHeight: CGFloat, font: UIFont?) -> NSMutableAttributedString{
        let attrString = NSMutableAttributedString(string: self)
        if self.trimmingCharacters(in: .whitespacesAndNewlines).count > 0 {
            let style = NSMutableParagraphStyle()
            style.lineHeightMultiple = lineHeight
            style.lineBreakMode = .byTruncatingTail
            style.alignment = .center
            attrString.addAttribute(NSAttributedString.Key.paragraphStyle, value: style, range: NSRange (location: 0, length: attrString.length))
            if let font = font {
                attrString.addAttribute(NSAttributedString.Key.font, value: font, range: NSRange (location: 0, length: attrString.length))
            }
        }
        return attrString
    }
    
    func convertAttributedtext(lineHeight: CGFloat, font: UIFont?) -> NSMutableAttributedString{
        let attrString = NSMutableAttributedString(string: self)
        if self.trimmingCharacters(in: .whitespacesAndNewlines).count > 0 {
            let style = NSMutableParagraphStyle()
            style.lineHeightMultiple = lineHeight
            style.lineBreakMode = .byTruncatingTail
            attrString.addAttribute(NSAttributedString.Key.paragraphStyle, value: style, range: NSRange (location: 0, length: attrString.length))
            if let font = font {
                attrString.addAttribute(NSAttributedString.Key.font, value: font, range: NSRange (location: 0, length: attrString.length))
            }
        }
        return attrString
    }
    
    func convertAttTextEllipsis(lineHeight: CGFloat, font: UIFont?) -> NSMutableAttributedString{
        let attrString = NSMutableAttributedString(string: self)
        if self.trimmingCharacters(in: .whitespacesAndNewlines).count > 0 {
            let style = NSMutableParagraphStyle()
            style.lineHeightMultiple = lineHeight
            attrString.addAttribute(NSAttributedString.Key.paragraphStyle, value: style, range: NSRange (location: 0, length: attrString.length))
            if let font = font {
                attrString.addAttribute(NSAttributedString.Key.font, value: font, range: NSRange (location: 0, length: attrString.length))
            }
        }
        return attrString
        
    }
    
    func convertToDateISO() -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = DateFormat1
        dateFormatter.locale = NSLocale.current
        let date = dateFormatter.date(from:self)
        return date
    }
    
    func convertToDateComment() -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = DateFormat6
        dateFormatter.locale = NSLocale.current
        let date = dateFormatter.date(from:self)
        return date
    }
    
    func convertToDateCalendar() -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = DateFormat5
        dateFormatter.locale = NSLocale.current
        let date = dateFormatter.date(from:self)
        return date
    }
    
    func convertToDateBookMark() -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = DateFormat4
        dateFormatter.locale = NSLocale.current
        let date = dateFormatter.date(from:self)
        return date
    }
    
    func containsString(_ aString: String) -> Bool {
        return self.range(of: aString) != nil
    }
    
    var htmlToAttributedString: NSAttributedString? {
        guard let data = data(using: .utf8) else { return nil }
        do {
            return try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding:String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch {
            return nil
        }
    }
    
    var htmlToString: String {
        return htmlToAttributedString?.string ?? ""
    }
    
    func convertTimeToHour(time: String) -> String {
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "HH:mm:ss.SS"
        let showDate = inputFormatter.date(from: time)
        if showDate != nil {
            inputFormatter.dateFormat = "mm:ss"
            let result = inputFormatter.string(from: showDate ?? Date())
            return  result
        }
        return time
    }
    
    func convertTimeToDate(time: String) -> String {
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = DateFormat3
        let showDate = inputFormatter.date(from: time)
        if showDate != nil {
            inputFormatter.dateFormat = "dd/MM/yyyy"
            let result = inputFormatter.string(from: showDate ?? Date())
            return  result
        }
        return time
    }
    
    func matchingStrings(regex: String) -> [[String]] {
        guard let regex = try? NSRegularExpression(pattern: regex, options: []) else { return [] }
        let nsString = self as NSString
        let results  = regex.matches(in: self, options: [], range: NSMakeRange(0, nsString.length))
        return results.map { result in
            (0..<result.numberOfRanges).map {
                result.range(at: $0).location != NSNotFound
                ? nsString.substring(with: result.range(at: $0))
                : ""
            }
        }
    }
    
    func isValidEmail() -> Bool {
           let regex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
           let predicate = NSPredicate(format:"SELF MATCHES %@", regex)
           return predicate.evaluate(with: self)
    }
    
//    func isValidName() -> Bool {
//           let regex = ".*[A-Z0-9a-z]"
//           let predicate = NSPredicate(format:"SELF MATCHES %@", regex)
//           return predicate.evaluate(with: self)
//    }
//
//    func isValidPassword() -> Bool {
//           let regex = ".*[A-Z0-9a-z@#$&*]"
//           let predicate = NSPredicate(format:"SELF MATCHES %@", regex)
//           return predicate.evaluate(with: self)
//    }
    func isValidName() -> Bool {
              let regex = "[^a-z0-9A-Z_ÀÁÂÃÈÉÊÌÍÒÓÔÕÙÚĂĐĨŨƠàáâãèéêìíòóôõùúăđĩũơƯĂẠẢẤẦẨẪẬẮẰẲẴẶẸẺẼỀỀỂưăạảấầẩẫậắằẳẵặẹẻẽềềểỄỆỈỊỌỎỐỒỔỖỘỚỜỞỠỢỤỦỨỪễếệỉịọỏốồổỗộớờởỡợụủứừỬỮỰỲỴÝỶỸửữựỳỵỷỹ]/u"
              let predicate = NSPredicate(format:"SELF MATCHES %@", regex)
              return predicate.evaluate(with: self)
//        return self.range(of: "(?i)([0-9A-ZẮẰẲẴẶĂẤẦẨẪẬÂÁÀÃẢẠĐẾỀỂỄỆÊÉÈẺẼẸÍÌỈĨỊỐỒỔỖỘÔỚỜỞỠỢƠÓÒÕỎỌỨỪỬỮỰƯÚÙỦŨỤÝỲỶỸỴ']+\\s?\\b){2,}", options: .regularExpression) != nil
       }
       
       func isValidPassword() -> Bool {
              let regex = "[A-Z0-9a-z!@#$%&*+ -=<>]{8,20}"
              let predicate = NSPredicate(format:"SELF MATCHES %@", regex)
              return predicate.evaluate(with: self)
       }
}

extension NSAttributedString{
    func convertAttributedtext(lineHeight: CGFloat, font: UIFont?) -> NSMutableAttributedString{
        let attrString = NSMutableAttributedString(attributedString: self)
//        if self.trimmingCharacters(in: .whitespacesAndNewlines).count > 0 {
            let style = NSMutableParagraphStyle()
            style.lineHeightMultiple = lineHeight
            style.lineBreakMode = .byTruncatingTail
            attrString.addAttribute(NSAttributedString.Key.paragraphStyle, value: style, range: NSRange (location: 0, length: attrString.length))
            if let font = font {
                attrString.addAttribute(NSAttributedString.Key.font, value: font, range: NSRange (location: 0, length: attrString.length))
            }
//        }
        return attrString
    }
}

