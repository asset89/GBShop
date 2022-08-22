//
//  AuthTests.swift
//  GBShopTests
//
//  Created by Asset Ryskul on 16.08.2022.
//

import XCTest
@testable import GBShop
import Alamofire

struct LoginStub: RequestRouter {
    let baseUrl: URL =  Constants.BASE_URL!
    let method: HTTPMethod = .get
    let path: String = "login.json"
    let login: String = "Somebody"
    let password: String = "mypassword"
    var parameters: Parameters? {
        return [ "username": login, "password": password]
    }
}

class AuthTests: XCTestCase {
    
    var sut: Auth!
    var errorParser: ErrorParserStub!
    lazy var sessionStub: Session = {
        let configuration = URLSessionConfiguration.default
        configuration.httpShouldSetCookies = false
        configuration.headers = .default
        let manager = Session(configuration: configuration)
        return manager
    }()
    
    var sessionQueueStub = DispatchQueue.global(qos: .utility)
    let expectation = XCTestExpectation(description: "Login https://raw.githubusercontent.com/GeekBrainsTutorial/online-store-api/master/responses/login.json")

    override func setUpWithError() throws {
        try super.setUpWithError()
        errorParser = ErrorParserStub()
        sut = Auth(errorParser: errorParser, sessionManager: sessionStub, queue: sessionQueueStub)
    }

    override func tearDownWithError() throws {
        sut  = nil
        errorParser = nil
        try super.tearDownWithError()
    }
    
    func testLoginMethod_ShouldPass() {
        sut.login(userName: "Somebody", password: "mypassword") { response in
            switch response.result {
            case .success(_):
                break
            case .failure(_):
                XCTFail()
            }
            self.expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10.0)
    }
}


