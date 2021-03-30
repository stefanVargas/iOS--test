//
//  FlickrData.swift
//  iOS 1st mindera test
//
//  Created by Stefan V. de Moraes on 27/03/21.
//

import Foundation

struct FlickrResultData: Codable {
    let photos: FlickrPhotos?
}

struct FlickrPhotos: Codable {
    let page: Int
    let pages: Int
    let perpage: Int
    let photo: [FlickrPhoto]
    let total: String
}


struct FlickrPhoto: Codable {
    
    let farm : Int
    let id : String
    let owner: String
    let secret : String
    let server : String
    let title: String
    
    let isFamily : Int
    let isFriend : Int
    let isPublic : Int
    
    enum CodingKeys: String, CodingKey {
        
        case isFamily = "isfamily"
        case isFriend = "isfriend"
        case isPublic = "ispublic"
        
        case farm
        case id
        case owner
        case secret
        case server
        case title
    }
    
    func imageStringURL(imageSize: APIConstants.FlickrImageSize) -> String {
        let letter = imageSize.letter
        let urlString = String(format: APIConstants.kImageURL, farm,
                               server, id, secret, letter)
        
        return urlString
    }
}
