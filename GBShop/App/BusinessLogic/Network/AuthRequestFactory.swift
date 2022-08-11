//
//  AuthRequestFactory.swift
//  GBShop
//
//  Created by Asset Ryskul on 10.08.2022.
//

import Alamofire

protocol AuthRequestFactory {
    func login(userName: String, password: String, completionHandler: @escaping (AFDataResponse<LoginResult>) -> Void)
}
