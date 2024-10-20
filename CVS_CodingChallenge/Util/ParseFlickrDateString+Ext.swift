//
//  ParseFlickrDateString+Ext.swift
//  CVS_CodingChallenge
//
//  Created by Daniel Medina Sada on 10/19/24.
//

import Foundation

extension String {
    
    /// As per flick documentation: The date taken should always be displayed in the timezone of the photo owner, which is to say, don't perform any conversion on it.
    /// https://www.flickr.com/services/api/misc.dates.html

    func parseFlickrDate() -> String? {
        let removedTimezoneDate = self.removeTimezone()
        let readFormatter = DateFormatter()
        readFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        guard let date = readFormatter.date(from: removedTimezoneDate) else { return nil }
        
        let writeFormatter = DateFormatter()
        writeFormatter.dateStyle = .medium
        writeFormatter.timeStyle = .short
        writeFormatter.timeStyle = .short
        return writeFormatter.string(from: date)
    }
    
    private func removeTimezone() -> String {
        var elements = self.split(separator: "-")
        elements.removeLast()
        return elements.joined(separator: "-")
    }
}
