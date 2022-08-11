//
//  AbstractRequestFactory.swift
//  GBShop
//
//  Created by Asset Ryskul on 10.08.2022.
//

import Foundation
import Alamofire

protocol AbstractRequestFactory {
    var errorParser: AbstractErrorParser { get }
    var sessionManager: Session { get }
    var queue: DispatchQueue { get }
    @discardableResult
    func request<T: Decodable>(request: URLRequestConvertible, completionHandler: @escaping (AFDataResponse<T>) -> Void) -> DataRequest
}

extension AbstractRequestFactory {
    @discardableResult
    public func request<T: Decodable>( request: URLRequestConvertible, completionHandler: @escaping (AFDataResponse<T>) -> Void) -> DataRequest {
        return sessionManager.request(request).responseCodable(errorParser: errorParser, queue: queue,completionHandler: completionHandler)
    }
}
