//
//  MainController.swift
//  PondSim
//
//  Created by Marcelo Sampaio on 07/03/20.
//  Copyright © 2020 Marcelo Sampaio. All rights reserved.
//

import UIKit

class MainController: UIViewController,UITableViewDataSource, UITableViewDelegate, DetailDelegate {
    

    // MARK: - Properties
    private var items = [Item]()
    private var selectedItem = Item()
    
    private var seq = 0
    
    // MARK: - Outlets
    @IBOutlet var headerView: UIView!
    @IBOutlet weak var headerLabel: UILabel!
    

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var footerView: UIView!
    @IBOutlet weak var footerLabel: UILabel!
    
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
    }

    // MARK: - App Data Source
    private func loadData() {
        if items.count == 0 {
            tableView.tableHeaderView = headerView
            footerView.isHidden = true
        }else{
            tableView.tableHeaderView = nil
            footerView.isHidden = false
        }
        tableView.reloadData()
        
        // calculation
        footerLabel.text = "Média apurada: \(calculation(items).currencyFormat())"
        if calculation(items) < 6 {
            footerView.backgroundColor = UIColor.red
        }else{
            footerView.backgroundColor = UIColor(red: 0/255, green: 143/255, blue: 0/255, alpha: 1)
        }
        
        
    }
    
    
    // MARK: - TableView DataSource and Delegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = items[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell") as! ItemCell
        cell.prova.text = item.prova
        cell.peso.text = String(item.peso)
        cell.nota.text = String(item.nota)
        
        if item.nota < 6 {
            cell.prova.textColor = UIColor.red
            cell.nota.textColor = UIColor.red
        }else{
            cell.prova.textColor = UIColor.black
            cell.nota.textColor = UIColor.black
        }
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedItem = items[indexPath.row]
        performSegue(withIdentifier: "showDetail", sender: self)
    }

    // MARK: - UI Actions
    @IBAction func addItem(_ sender: Any) {
        selectedItem = Item()
        performSegue(withIdentifier: "showDetail", sender: self)
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            let controller = segue.destination as! DetailController
            controller.delegate = self
            controller.item = selectedItem
            
        }
    }
    
    // MARK: - Detail Delegate
    func didChangeDataEntry(item: Item) {
        print("detail delegate. item: \(item)")
        seq = items.count + 1
        item.prova = "V\(seq)"
        items.append(item)
        
        loadData()
        
    }
    
    func didDeleteItem(item: Item) {
        print("delete item delegate. item: \(item)")
    }
    
    // MARK: - Calculation Engine
    private func calculation(_ items: [Item]) -> Double {
        var average : Double = 0.0
        var notaSum : Double = 0.0
        var pesoSum : Int = 0
        
        for item in items {
            pesoSum = pesoSum + item.peso
            notaSum = notaSum + (item.nota * Double(item.peso))
        }
        
        average = notaSum / Double(pesoSum)
    
        return average
    }
}

