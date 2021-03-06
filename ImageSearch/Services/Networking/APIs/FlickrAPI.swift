//
//  FlickrAPI.swift
//  ImageSearch
//
//  Created by Denis Simon on 03/09/2020.
//

import Foundation

enum FlickrAPI {
    case search(string: String)
    case getHotTagsList(count: Int)
}

extension FlickrAPI: EndpointType {
    
    var method: Method {
        switch self {
        case .search, .getHotTagsList:
            return .GET
        }
    }
    
    var path: String {
        switch self {
        case .search(let string):
            return "/rest/?method=flickr.photos.search&api_key=\(Constants.FlickrAPI.apiKey)&text=\(string)&per_page=\(Constants.FlickrAPI.photosPerRequest)&format=json&nojsoncallback=1"
        case .getHotTagsList(let count):
            return "/rest/?method=flickr.tags.getHotList&api_key=\(Constants.FlickrAPI.apiKey)&period=week&count=\(count)&format=json&nojsoncallback=1"
        }
    }
    
    var baseURL: String {
        return Constants.FlickrAPI.baseURL
    }
    
    var constructedURL: URL? {
        switch self {
        case .search(_), .getHotTagsList(_):
            return URL(string: self.baseURL + self.path)
        }
    }
}

