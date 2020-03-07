//
//  DetailController.swift
//  PondSim
//
//  Created by Marcelo Sampaio on 07/03/20.
//  Copyright © 2020 Marcelo Sampaio. All rights reserved.
//

import UIKit

// MARK: - Prototols
protocol DetailDelegate: class {
    func didChangeDataEntry(item: Item)
}

class DetailController: UITableViewController {
    
    // MARK: - Properties
    public var item = Item()
    
    // delegate
    // delegate
    weak var delegate: DetailDelegate?
    
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
        // pass data back to the caller
        delegate?.didChangeDataEntry(item: item)
        // return to the caller
        self.dismiss(animated: true, completion: nil)
        
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
