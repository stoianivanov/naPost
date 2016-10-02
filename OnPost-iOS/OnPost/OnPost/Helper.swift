//
//  Helper.swift
//  OnPost
//
//  Created by Marina Georgieva on 10/2/16.
//  Copyright © 2016 Marina Georgieva. All rights reserved.
//

import UIKit


final class Helpers {
    
    class func saveImage(name: String) -> URL? {
        
        guard let image = UIImage(named: name) else {
            return nil
        }
        
        let imageData = UIImagePNGRepresentation(image)
        let documentsURL = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask)[0]
        do {
            let imageURL = documentsURL.appendingPathComponent("\(name).png")
            _ = try imageData?.write(to: imageURL)
            return imageURL
        } catch {
            return nil
        }
    }
}

struct Consts {
    static let requestIdentifier = "requestIdentifier"
    static let replyIdentifier = "replyIdentifier"
    static let categoryIdentifier = "catgeoryIdentifier"
    static let imageIdentifier = "imageIdentifier"
    static let customContentIdentifier = "customContentIdentifier"
}
