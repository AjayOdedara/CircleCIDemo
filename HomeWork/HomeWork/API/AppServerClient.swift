//
//  AppServerClient.swift
//  HomeWork
//
//  Created by Ajay Odedra on 04/04/19.
//  Copyright © 2019 Ajay Odedra. All rights reserved.
//

import Alamofire
import SwiftyJSON

// MARK: - AppServerClient
class AppServerClient {

    
    class var sharedInstance: AppServerClient {
        struct Static {
            static let instance: AppServerClient! = AppServerClient()
        }
        return Static.instance
    }
    
    
    func api(url:String, param:[String:Any]?,method:HTTPMethod, success: @escaping () -> Void, failure: ((NSError?) -> Void)?) -> Void {
        
        Alamofire.request(url, method: method, parameters: param, encoding: JSONEncoding.default)
            .validate()
            .responseJSON { response in
                switch response.response?.statusCode {
                case 200:
                    success()
                case .none, .some:
                    let error = response.result.error
                    failure?(error! as NSError)
                }
        }
    }
    
    
    // MARK: - LOGs
    func logStats(url:String){
        guard let escapedUrlString = url.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed) else { return }
        
        api(url: escapedUrlString, param: nil, method: .get, success: {
            print("Successfully Sent the stats")
        }) { (error) in }
    }
    
    
    // MARK: - GetFruits
    enum GetFailureReason: Int, Error {
        case unAuthorized = 401
        case notFound = 404
        case serverError = 500
    }

    
    typealias GetFruitssResult = Result<[Fruit], GetFailureReason>
    typealias GetFruitsCompletion = (_ result: GetFruitssResult) -> Void

    func getFruits(completion: @escaping GetFruitsCompletion) {
        Alamofire.request(GlobalConstants.URL.Api.fruits)
            .validate()
            .responseJSON { response in
                switch response.result {
                case .success:
                    
                    do {
                        guard let data = response.data else {
                            let url = GlobalConstants.URL.Api.stats + "event=error&data=GetFruits fucntion Nil data in Api response"
                            self.logStats(url: url)
                            completion(.failure(nil))
                            return
                        }
                        // LOG Load
                        let ms = String(format: "%.2f", ceil(response.timeline.totalDuration*100)/100)
                        let url = GlobalConstants.URL.Api.stats + "event=load&data=\(ms)"
                        self.logStats(url: url)
                        
                        let decodedFruitData = try JSONDecoder().decode(FruitData.self, from: data)
                        completion(.success(payload: decodedFruitData.fruit))
                        
                    } catch {
                        let url = GlobalConstants.URL.Api.stats + "event=error&data=Something wrong with response json, Decoder failed"
                        self.logStats(url: url)
                        completion(.failure(nil))
                    }
                    
                case .failure(let error):
                    
                    print(error.localizedDescription)
                    if let statusCode = response.response?.statusCode,
                        let reason = GetFailureReason(rawValue: statusCode) {
                        completion(.failure(reason))
                    }else{
                        completion(.failure(nil))
                    }
                    // LOG Error
                    let url = GlobalConstants.URL.Api.stats + "event=error&data=\(error.localizedDescription)"
                    self.logStats(url: url)
                    
                }
        }
    }

}
