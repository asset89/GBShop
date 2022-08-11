//
//  BaseNetwork.swift
//  GBShop
//
//  Created by Asset Ryskul on 11.08.2022.
//

import Alamofire

class BaseNetwork: AbstractRequestFactory {
    let errorParser: AbstractErrorParser
    let sessionManager: Session
    let queue: DispatchQueue
    let baseUrl = Constants.BASE_URL!
    
    
    init( errorParser: AbstractErrorParser, sessionManager: Session, queue: DispatchQueue = DispatchQueue.global(qos: .utility)) {
        self.errorParser = errorParser
        self.sessionManager = sessionManager
        self.queue = queue
    }
}
