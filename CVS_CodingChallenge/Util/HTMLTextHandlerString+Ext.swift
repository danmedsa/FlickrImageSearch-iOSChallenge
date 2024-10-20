//
//  HTMLTextHandlerString+Ext.swift
//  CVS_CodingChallenge
//
//  Created by Daniel Medina Sada on 10/20/24.
//

import Foundation
import SwiftUICore

extension String {
    @MainActor func htmlAttributedString(font: Font) -> AttributedString {
        var attributedStr = AttributedString(self)
        attributedStr.font = font
        guard let data = self.data(using: String.Encoding.utf16, allowLossyConversion: false) else { return attributedStr }
        do {
            let html = try NSMutableAttributedString(
                data: data,
                options: [.documentType: NSAttributedString.DocumentType.html],
                documentAttributes: nil)
            attributedStr = AttributedString(html)
            
            attributedStr.font = font
            return attributedStr
        } catch {
            return attributedStr
        }
    }
}
