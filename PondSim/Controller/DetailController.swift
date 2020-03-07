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
    func didAddItem(item: Item)
    func didEditItem(item: Item)
    func didDeleteItem(item: Item)
}

class DetailController: UITableViewController {
    
    // MARK: - Properties
    public var item = Item()
    public var isEdit = false

    
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
        
        if isEdit {
            pesoTextField.text = String(item.peso)
            notaTextField.text = String(item.nota).replacingOccurrences(of: ".", with: ",")
        }
        
    }

    // MARK: - UI Actions
    @IBAction func saveItem(_ sender: Any) {

        if !isValidDataEntry() {
            view.alert(msg: "Você deve informar peso e nota!", sender: self)
            return
        }
    
        if !isEdit {
            item = Item()
            item.prova = "Vn"
            item.peso = Int(pesoTextField.text!)!
            item.nota = Double(notaTextField.text!.replacingOccurrences(of: ",", with: "."))!
            
            // pass data back to the caller
            delegate?.didAddItem(item: item)
            
        }else{
            item.peso = Int(pesoTextField.text!)!
            item.nota = Double(notaTextField.text!.replacingOccurrences(of: ",", with: "."))!
            
            // pass data back to the caller
            delegate?.didEditItem(item: item)
            
        }
        
        
        
        // return to the caller
        self.dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func deleteItem(_ sender: Any) {

        // pass data back to the caller
        delegate?.didDeleteItem(item: item)
        
        // return to the caller
        self.dismiss(animated: true, completion: nil)
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
