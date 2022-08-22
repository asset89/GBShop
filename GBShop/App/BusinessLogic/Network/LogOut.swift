//
//  LogOut.swift
//  GBShop
//
//  Created by Asset Ryskul on 11.08.2022.
//

import Foundation
import Alamofire

class LogOut: BaseNetwork {
}

extension LogOut: LogOutRequestFactory {
    func logout(id: Int, completionHandler: @escaping (AFDataResponse<RegResult>) -> Void) {
        let requestModel = LogOut(baseUrl: Constants.BASE_URL!, id: id)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension LogOut {
    struct LogOut: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "logout.json"
        let id: Int
        var parameters: Parameters? {
            return [ "id_user": id]
        }
    }
}
