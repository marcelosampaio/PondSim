//
//  DetailController.swift
//  PondSim
//
//  Created by Marcelo Sampaio on 07/03/20.
//  Copyright © 2020 Marcelo Sampaio. All rights reserved.
//

import UIKit

class DetailController: UITableViewController {
    
    // MARK: - Properties
    public var item = Item()
    
    // MARK: - Outlets
    @IBOutlet weak var pesoTextField: UITextField!
    @IBOutlet weak var notaTextField: UITextField!
    
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - UI Actions
    @IBAction func saveItem(_ sender: Any) {
        print("🥁 save item")
    }
    
    @IBAction func deleteItem(_ sender: Any) {
        print("🥁 delete item")
    }
    
}
