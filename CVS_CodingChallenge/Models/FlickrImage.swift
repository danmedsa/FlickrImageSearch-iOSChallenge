//
//  FlickrImage.swift
//  CVS_CodingChallenge
//
//  Created by Daniel Medina Sada on 10/19/24.
//

struct FlickrImage: Codable {
    var link: String
    var title: String
    var description: String
    var author: String
    var date_taken: String
    
    enum CodingKeys: String, CodingKey {
        case link = "media"
        case title, description, author, date_taken
    }
    
    enum MediaKeys: String, CodingKey {
        case m
    }
    
    static var example: FlickrImage {
        FlickrImage(link: "https://live.staticflickr.com/65535/54077728957_d407c00486_m.jpg",
                    title: "06 African Crested Porcupine",
                    description: "description",
                    author: "nobody@flickr.com (\"megatti\")",
                    date_taken: "2023-08-26T09:45:56-08:00")
    }
    
    init(link: String, title: String, description: String, author: String, date_taken: String) {
        self.link = link
        self.title = title
        self.description = description
        self.author = author
        self.date_taken = date_taken
    }
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.title = try container.decode(String.self, forKey: .title)
        self.description = try container.decode(String.self, forKey: .description)
        self.author = try container.decode(String.self, forKey: .author)
        self.date_taken = try container.decode(String.self, forKey: .date_taken)
        
        let mediaContainer = try container.nestedContainer(keyedBy: MediaKeys.self, forKey: .link)
        self.link = try mediaContainer.decode(String.self, forKey: .m)
    }
}
