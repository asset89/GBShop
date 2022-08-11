//
//  Registration.swift
//  GBShop
//
//  Created by Asset Ryskul on 10.08.2022.
//

import Alamofire

class Registration: BaseNetwork {
}

extension Registration: RegisterRequestFactory {
    func register(id: Int, userName: String, password: String, email: String, gender: String, creditCard: String?, bio: String?, completionHandler: @escaping (AFDataResponse<RegResult>) -> Void) {
        let requestModel = Register(baseUrl: baseUrl, id: id, login: userName, password: password, email: email, gender: gender, creditCard: creditCard, bio: bio)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension Registration {
    struct Register: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "registerUser.json"
        let id: Int
        let login: String
        let password: String
        let email: String
        let gender: String
        let creditCard: String?
        let bio: String?
        var parameters: Parameters? {
            return [ "id_user": id,
                     "username": login,
                     "password": password,
                     "email": email,
                     "gender": gender,
                     "credit_card": creditCard ?? "",
                     "bio": bio ?? ""
                   ]
        }
    }
}
