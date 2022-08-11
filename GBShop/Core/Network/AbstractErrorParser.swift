//
//  AbstractErrorParser.swift
//  GBShop
//
//  Created by Asset Ryskul on 10.08.2022.
//

import Foundation

protocol AbstractErrorParser {
    func parse(_ result: Error) -> Error
    func parse(response: HTTPURLResponse?, data: Data?, error: Error?) -> Error?
}
