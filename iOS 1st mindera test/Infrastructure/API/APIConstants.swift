//
//  APIConstants.swift
//  iOS 1st mindera test
//
//  Created by Stefan V. de Moraes on 27/03/21.
//

import Foundation

class APIConstants: NSObject {

    static let kApiKey = "f9cc014fa76b098f9e82f1c288379ea1"
    
    static let kSearchURL = "https://api.flickr.com/services/rest/?method=flickr"
    + ".photos.search&api_key=\(APIConstants.kApiKey)&format=json&nojsoncallback=1&"
    + "safe_search=1&per_page=\(APIConstants.photosPerPage)&text=%@&page=%ld"
    
    static let kImageURL =
        "https://farm%d.staticflickr.com/%@/%@_%@_%@.jpg"
    
    static let kDataErrorMessage: String = "Sorry, data handling problem."
    static let kErrorMessage = "Ops...Something went wrong."

    
    static let photosPerPage = 30

    enum FlickrImageSize: String {
        case smallSquare = "s"
        case largeSquare = "q"
        case thumbnail = "t"
        case small = "m"
        case medium = "z"
        case large = "b"
        case original = "o"
        
        var letter: String {
            return self.rawValue
        }
    }
}
