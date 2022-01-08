//
//  APIClient.swift
//  TestingCI
//
//  Created by Mykhaylo Levchuk on 08/01/2022.
//

import Foundation

enum APIError: Error {
    case mockError
}

class APIClient {
    
    var result: Result<Int, APIError>!
    
    func performRequest(completion: (Result<Int, APIError>) -> Void) {
        completion(result)
    }
}
