//
//  ErrorParser.swift
//  GBShop
//
//  Created by Asset Ryskul on 10.08.2022.
//

import Foundation

class ErrorParser: AbstractErrorParser {
    
    func parse(_ result: Error) -> Error {
        return result
    }
    
    func parse(response: HTTPURLResponse?, data: Data?, error: Error?) -> Error? {
        return error
    }
}
