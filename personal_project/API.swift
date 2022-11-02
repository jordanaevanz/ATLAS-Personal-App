//
//  API.swift
//  personal_project
//
//  Created by Jordan Evans on 10/12/22.
//

import Foundation

class API {
    
    enum APIError: Error {
        case FetchError
        case decodingError
        case notImplemented
        case unknownError
        case networkError(Error)
    }
    
    enum Path: String{
        case Title
        case Genre
        case Poster
        
        //        var url: URL {
        //            API.url.appending(component: self.rawValue)
        //        }
    }
    
    
    static func searchURL(searchTerm: String, page: Int) -> URL? {
        let apiKey = "f8344039"
        let urlString = "http://www.omdbapi.com"
        //validates that this is a real url
        guard var url = URL(string: urlString) else {
            return nil
        }
        
        let queryItems: [URLQueryItem] = [
            URLQueryItem(name: "s", value: searchTerm),
            URLQueryItem(name: "apiKey", value: apiKey),
            URLQueryItem(name: "page", value: String(page))
        ]
        // url.append(queryItems: queryItems)
        return url
    }
    
    // SearchURL(searchTerm: "hello", page: 1)
    
    
    //this is confusing
    static func fetchMovie(completion: @escaping (Result<[Movie], APIError>) -> Void) {
        //make request to web and error handle whether the request was successful or not
        //getting json back and then parse it into movie object
        
        
        guard let url = searchURL(searchTerm: "", page: 1) else {
            assertionFailure("couldn't create search URL")
            return
        }
        
        
        fetchJSON(url: url) { result in
            switch result {
            case .success(let data):
                do {
                    // JSONSerialization
                    let json = try JSONSerialization.jsonObject(with: data)
                    //                    if let json = try JSONSerialization.jsonObject(with: data) as? [String: Any],
                    //                       let resultData = try? JSONSerialization.data(withJSONObject: json["results "]) {
                    //                            let Title = try Movie.decodeJSONCollection(from: resultData)
                    //                            completion(.success(Title))
                    //                        }
                } catch let error {
                    print("could not decode collection.", error)
                    completion(.failure(.decodingError))
                }
                print("success")
                //                    //handle HTTP failure
            case .failure(let error):
                print("error occurred when fetching movie.", error)
                completion(.failure(.networkError(error)))
                //                }
            }
        }
    }
    
    
    static func fetchJSON(url: URL, completion: @escaping (Result<[Data], APIError>) -> Void) {
        //make request to web and error handle whether the request was successful or not
        //getting json back and then parse it into movie object
        let session = URLSession.shared
        let request = URLRequest(url: url)
        let task = session.dataTask(with: request) { data, response, error in
            //below is all error handling
            guard let data = data else {
                if let error = error {
                    print("error occured while fetching json.", error)
                    completion(.failure(.networkError(error)))
                } else {
                    assertionFailure("unexpected codepath")
                    completion(.failure(.unknownError))
                }
                return
            }
            //returning data with success call back
            completion(.success([data]))
        }
        //kicks off data task, without this nothing will happen
        task.resume()
    }
}


extension Decodable {
    static func decodeJSON(from data: Data) throws -> Self {
        return try JSONDecoder().decode(Self.self, from:data)
    }
    
    static func decodeJSONCollection(from data: Data) throws -> [Self] {
        return try JSONDecoder().decode([Self].self, from:data)
    }
}






