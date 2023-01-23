//
//  ViewController.swift
//  CryptoMarket
//
//  Created by İbrahim Bayram on 23.01.2023.
//

import UIKit

class ViewController: UIViewController , UITableViewDelegate, UITableViewDataSource{

    @IBOutlet weak var tableView: UITableView!
    private var cryptoCurrencyListViewModel : CryptoCurrencyListViewModel!
    var colorArray = [UIColor]()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        self.colorArray = [
            UIColor.lightGray,
            UIColor.gray,
            UIColor.darkGray
        ]
        getData()
    }
    
    func getData() {
        let url = URL(string: "https://raw.githubusercontent.com/atilsamancioglu/K21-JSONDataSet/master/crypto.json")!
        WebService().downloadCurrencies(url: url) { (currencies) in
            if let currencies = currencies {
                self.cryptoCurrencyListViewModel = CryptoCurrencyListViewModel(cryptoCurrencyList: currencies)
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if cryptoCurrencyListViewModel == nil {
            return 0
        }else {
            return cryptoCurrencyListViewModel.numberOfRowsInSection()
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CryptoCell
        let cryptoViewModel = self.cryptoCurrencyListViewModel.cryptoIndex(indexPath.row)
        cell.priceLabel.text = cryptoViewModel.price
        cell.nameLabel.text = cryptoViewModel.name
        cell.backgroundColor = self.colorArray[indexPath.row % 3]
        return cell
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90.0
    }

}

