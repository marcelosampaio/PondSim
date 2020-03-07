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
    
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var deleteButton: UIButton!
    
    
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        if item.prova.isEmpty {
            deleteButton.isHidden = true
        }else{
            deleteButton.isHidden = false
        }
    }

    // MARK: - UI Actions
    @IBAction func saveItem(_ sender: Any) {
        print("🥁 save item")
        if !isValidDataEntry() {
            print("🚣‍♂️ invalid data entry!!!")
        }
    }
    
    @IBAction func deleteItem(_ sender: Any) {
        print("🥁 delete item")
    }
    
    // MARK: - Data Entry Helper
    private func isValidDataEntry() -> Bool {
        if pesoTextField.text!.isEmpty {
            return false
        }
        if notaTextField.text!.isEmpty {
            return false
        }
        return true
    }
    
    
    
}
