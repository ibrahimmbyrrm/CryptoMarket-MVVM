//
//  Webservice.swift
//  CryptoMarket
//
//  Created by İbrahim Bayram on 23.01.2023.
//

import Foundation

class WebService {
    //Escaping closure kullanma amacımız fonksyon tamamlandıktan sonra bir closure çalıştırmak istememeiz.
    func downloadCurrencies(url : URL, completion : @escaping ([Currency]?) -> Void) {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            }else if let data = data {
                let cryptoList = try? JSONDecoder().decode([Currency].self, from: data)
                
                if let cryptoList = cryptoList {
                    completion(cryptoList)
                }
            }
        }.resume()
    }
}
