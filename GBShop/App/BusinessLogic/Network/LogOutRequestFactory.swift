//
//  LogOutRequestFactory.swift
//  GBShop
//
//  Created by Asset Ryskul on 11.08.2022.
//

import Foundation
import Alamofire

protocol LogOutRequestFactory {
    func logout(id: Int, completionHandler: @escaping (AFDataResponse<RegResult>) -> Void)
}
