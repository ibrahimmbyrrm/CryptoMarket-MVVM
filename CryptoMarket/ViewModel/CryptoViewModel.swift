//
//  CryptoViewModel.swift
//  CryptoMarket
//
//  Created by İbrahim Bayram on 23.01.2023.
//

import Foundation

struct CryptoCurrencyListViewModel {
    let cryptoCurrencyList : [Currency]
    func numberOfRowsInSection() -> Int {
        return cryptoCurrencyList.count
    }
    //Bu fonksiyon ile diğer viewmodel ile bağlantıyı sağlıyoruz.
    func cryptoIndex(_ index : Int) -> CryptoViewModel {
        let crypto = cryptoCurrencyList[index]
        return CryptoViewModel(cryptoCurrency: crypto)
    }

}
struct CryptoViewModel {
    let cryptoCurrency : Currency
    
    var name : String {
        return self.cryptoCurrency.currency
    }
    var price : String {
        return self.cryptoCurrency.price
    }
}
