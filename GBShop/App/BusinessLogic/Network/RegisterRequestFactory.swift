//
//  RegisterRequestFactory.swift
//  GBShop
//
//  Created by Asset Ryskul on 10.08.2022.
//

import Alamofire
protocol RegisterRequestFactory {
    func register(id: Int, userName: String, password: String, email: String, gender: String, creditCard: String?, bio: String?, completionHandler: @escaping (AFDataResponse<RegResult>) -> Void)
}

