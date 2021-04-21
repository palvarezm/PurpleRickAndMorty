//
//  APIClient.swift
//  RickAndMorty
//
//  Created by Paul Alvarez on 20/04/21.
//

import Foundation
import Alamofire

public class APIClient{
    
    typealias WebServiceResponse<T: Decodable> = (T?, Error?) -> Void
    func call<T: Decodable>(stringURL: String, httpMethod: HTTPMethod, type: T.Type, completion: @escaping WebServiceResponse<T>){
        AF.request(stringURL, method: httpMethod).responseDecodable(of: T.self) { response in
            if let error = response.error {
                debugPrint(error)
                completion(nil, error)
            }
            else if let value = response.value {
                debugPrint(value)
                completion(value, nil)
            }
        }
    }
}
