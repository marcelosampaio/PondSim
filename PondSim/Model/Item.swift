//
//  Item.swift
//  PondSim
//
//  Created by Marcelo Sampaio on 07/03/20.
//  Copyright © 2020 Marcelo Sampaio. All rights reserved.
//

import Foundation

class Item {
    var prova = String()
    var peso = Int()
    var nota = Double()
    
    init() {
        self.prova = String()
        self.peso = Int()
        self.nota = Double()
    }
    
    init(prova: String, peso: Int, nota: Double) {
        self.prova = prova
        self.peso = peso
        self.nota = nota
    }
    
}
