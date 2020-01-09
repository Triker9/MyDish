//
//  ConfirmShopTableView.swift
//  MyDish
//
//  Created by Pawel Krzywik on 04/01/2020.
//  Copyright © 2020 Pawel Krzywik. All rights reserved.
//

import Foundation
import UIKit

extension ConfirmShopListViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ConfirmShopListTableViewCell", for: indexPath) as! ConfirmShopListTableViewCell
        cell.layer.borderWidth = 5
        cell.layer.borderColor = UIColor.systemGray6.cgColor
        cell.quantityLbl.text = quantityProduct[indexPath.row]
        cell.quantityLbl.font = UIFont.boldSystemFont(ofSize: 17)
        cell.frame = CGRect(x: 0, y: 0, width: tableView.bounds.width, height: 100)
        cell.nameLbl.text = products[indexPath.row]
        cell.nameLbl.font = UIFont.boldSystemFont(ofSize: 17)
        cell.checkBtn.tag = indexPath.row
        cell.checkBtn.addTarget(self, action: #selector(check(sender:)), for: .touchUpInside)
        cell.checkBtn.tintColor = .systemGreen
        return cell
    }
    
    @objc private func check(sender: UIButton){
        let id = sender.tag
        if sender.isSelected{
            sender.isSelected = false
            arraySavedQuantity.append(quantityProduct[id])
            arraySavedProducts.append(products[id])
        }else{
            sender.isSelected = true
            //if removable index whose is after another before deleted, array change indexes (without hole) conditions find correct index
            if let i = arraySavedProducts.firstIndex(where: {$0 == products[id]}){
                arraySavedProducts.remove(at: i)
                arraySavedQuantity.remove(at: i)
            }
        }
    }
}