//
//  ViewController.swift
//  BitcoinTicker
//
//  Created by Angela Yu on 23/01/2016.
//  Copyright © 2016 London App Brewery. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    let baseURL = "https://apiv2.bitcoinaverage.com/indices/global/ticker/BTC"
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD", "HUF" ,"IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    let currencySymbols = ["$", "R$", "$", "¥", "€", "£", "$", "HUF", "Rp", "₪", "₹", "¥", "$", "kr", "$", "zł", "lei", "₽", "kr", "$", "$", "R"]
    var finalURL = ""
    var symbol = ""

    //Pre-setup IBOutlets
    @IBOutlet weak var bitcoinPriceLabel: UILabel!
    @IBOutlet weak var currencyPicker: UIPickerView!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        currencyPicker.delegate = self
        currencyPicker.dataSource = self
       
    }

    
    //TODO: Place your 3 UIPickerView delegate methods here
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return currencyArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return currencyArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        finalURL = baseURL + currencyArray[row]
        getBitCoinData(url: finalURL)
        symbol = currencySymbols[row]
    }
    

    
    
    
//    
//    //MARK: - Networking
//    /***************************************************************/
//    
    func getBitCoinData(url: String) {
        
        Alamofire.request(url, method: .get)
            .responseJSON { response in
                if response.result.isSuccess {
                    let bitCoinData : JSON = JSON(response.result.value!)
                    self.updateWeatherData(json: bitCoinData)

                } else {
                    print("Error: \(String(describing: response.result.error))")
                    self.bitcoinPriceLabel.text = "Connection"
                }
            }

    }
//
//    
//    
//    
//    
//    //MARK: - JSON Parsing
//    /***************************************************************/
//    
    func updateWeatherData(json : JSON) {
        
        if let price = json["last"].double {
        
            bitcoinPriceLabel.text = symbol + String(Int(round(price)))
        } else {
            bitcoinPriceLabel.text = "Price unavailable"
        }
    }
//




}

