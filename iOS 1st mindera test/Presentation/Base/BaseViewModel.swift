//
//  BaseViewModel.swift
//  iOS 1st mindera test
//
//  Created by Stefan V. de Moraes on 27/03/21.
//

import UIKit

class BaseViewModel: NSObject {
    
    enum ContentState {
        case loaded
        case error
        case failure
        case none
    }

    var contentState: ContentState = .none
    private let provider = FlickrProviderAPI()
    private(set) var photos: [FlickrPhoto] = []
    var errorText = String()
    var page: Int = 1
    private var totalPages = 1
    var tagText: String = StringConstants.initialTagKittens
    
    func request(page: Int, searchTag: String,
                 completion: @escaping () -> Void) {
        
        provider.requestSearch(searchTag: searchTag, page: page) { [weak self]
            (result) in
            switch result {
            case .success(let flickrData):
                let flickerPhotos = flickrData?.photos?.photo ?? []
                self?.photos.append(contentsOf: flickerPhotos)
                self?.contentState = .loaded
                self?.totalPages = flickrData?.photos?.pages ?? 1
                completion()
                
            case .error(let errMessage):
                self?.contentState = .error
                self?.errorText = errMessage
                completion()

                
            case .failure(let failText):
                self?.contentState = .failure
                self?.errorText = failText
                completion()
            }
        }
    }
    
    func cleanPhotos() {
        self.photos.removeAll()
    }
    
    func fetchNextPage(completion:@escaping () -> Void) {
        if page < totalPages {
            page += 1
            request(page: page, searchTag: self.tagText) {
                completion()
            }
        } else {
            completion()
        }
    }
}
