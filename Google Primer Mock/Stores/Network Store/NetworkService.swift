//
//  NetworkService.swift
//  Google Primer Mock
//
//  Created by Jay Mehta on 07/06/20.
//  Copyright © 2020 Jay Mehta. All rights reserved.
//

import Foundation

enum NetworkService {

    // MARK: - Network request methods

    static func request<T: Codable>(router: Router, completion: @escaping (Result<T, Error>) -> Void) {

        var components = URLComponents()
        components.scheme = router.scheme
        components.host = router.host
        components.path = router.path
        components.queryItems = router.parameters

        guard let url = components.url else { return }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = router.method

        let session = URLSession(configuration: .default)
        let dataTask = session.dataTask(with: urlRequest) { data, response, error in
            if let error = error {
                completion(.failure(error))
                print(error.localizedDescription as Any)
                return
            }
            guard response != nil else {
                return
            }
            guard let data = data else {
                return
            }
            guard let replacedData = String(data: data, encoding: .utf8)?.replacingOccurrences(of: "/{", with: "{").data(using: String.Encoding.utf8) else {
                return
            }

            do {
                let responseObject = try JSONDecoder().decode(T.self, from: replacedData)
                DispatchQueue.main.async {
                    completion(.success(responseObject))
                }
            } catch let err {
                print("Error occured while decoding JSON object with error - \(err)")
            }
        }
        dataTask.resume()
    }

}
