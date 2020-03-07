//
//  Double+Utils.swift
//  PondSim
//
//  Created by Marcelo Sampaio on 07/03/20.
//  Copyright © 2020 Marcelo Sampaio. All rights reserved.
//

import Foundation
import UIKit

extension Double {
    func currencyFormat() -> String {
        
        return "\(String(format: "%.2f", self).replacingOccurrences(of: ".", with: ","))"

    }
    

    func currencyDecimalPointFormat() -> String {
        
        let currencyFormatter = NumberFormatter()
        currencyFormatter.usesGroupingSeparator = true
        currencyFormatter.numberStyle = .currency
        currencyFormatter.locale = Locale.current

        return currencyFormatter.string(from: NSNumber(value: self))!

    }
    
    
    
    
    
    
}
