//
//  NetworkClient.swift
//  VnPay_Challenge_Pokemon
//
//  Created by VCCORP on 5/7/24.
//

import Foundation
import UIKit

public enum NetworkingError: Error, Equatable {
    case noInternet
    case timeout
    case internalServerError
    case notfound
    case codableError(Error)
    case cancelled
    case badURL
    case serverCertificateHasBadDate
    case clientError
    case unknowError
    case responseJSONError

    public static func == (lhs: NetworkingError, rhs: NetworkingError) -> Bool {
        return lhs.localizedDescription == rhs.localizedDescription
    }
}

class NetworkClient {
    func defaultHeader() -> [String: String] {
        let appInfo = NSDictionary(contentsOf: Bundle.main.url(forResource: "Info", withExtension: "plist")!)
        let appVersion = (appInfo?[kCFBundleVersionKey as String] as? String) ?? "Unknowned"
        return [
            "os": "ios",
            "os_version": UIDevice.current.systemVersion,
            "app_version": appVersion
        ]
    }

    // MARK: - Excuted
    func excuted<T: Decodable>(urlAPI: String, header: [String : String], type: T.Type, completionHandler: ((T?, Error?) -> Void)?) {
        let session = URLSession.shared
        guard let url = URL (string: urlAPI) else {
            completionHandler?(nil, NetworkingError.badURL)
            return
        }

        var request = URLRequest (url: url)
        request.allHTTPHeaderFields = self.defaultHeader()
        let task = session.dataTask(with: request) { data, response, errors in
            if let errors = errors {
                completionHandler?(nil, errors)
                return
            }

            do {
                guard let data = data else {
                    completionHandler?(nil, errors)
                    return
                }
                let jsonData = try JSONDecoder().decode(T.self, from: data)
                completionHandler?(jsonData, nil)

            } catch {
                print("API Error: \(error)")
            }
        }

        task.resume()
    }

    
}
