//
//  FlickrProviderAPI.swift
//  iOS 1st mindera test
//
//  Created by Stefan V. de Moraes on 27/03/21.
//

import Foundation

protocol FlickrAPIProtocol: class {
    func requestSearch(searchTag: String, page: Int,
                       completion: @escaping (Result<FlickrResultData?>) -> Void)
}

class FlickrProviderAPI: NSObject {
    
    static func instance() -> FlickrProviderAPI {
        return FlickrProviderAPI()
    }
}

extension FlickrProviderAPI: FlickrAPIProtocol {
    
    func requestSearch(searchTag: String, page: Int, completion: @escaping (Result<FlickrResultData?>) -> Void) {
        let urlString = String(format: APIConstants.kSearchURL, searchTag, page)
        let request =  Request(requestMethod: .GET, urlString: urlString)
        guard let urlRequest = request as URLRequest? else { return }
        
        URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            
            guard error == nil else {
                return completion(.failure(error!.localizedDescription))
            }
            
            guard let data = data else {
                return completion(.failure(error?.localizedDescription ?? APIConstants.kErrorMessage))
            }
            
            guard let stringResponse = String(data: data,
                                              encoding: String.Encoding.utf8)
            else {
                return completion(.failure(error?.localizedDescription ?? APIConstants.kErrorMessage))
            }
            
            print("Respone: \(stringResponse)")
            
            guard let responseResultData = try? JSONDecoder().decode(FlickrResultData.self, from: data) else {
                completion(
                    .error("\(APIConstants.kDataErrorMessage) \(String(describing: error?.localizedDescription))."))
                return
            }
            return completion(.success(responseResultData))
            
        }.resume()
        
    }
    
}
