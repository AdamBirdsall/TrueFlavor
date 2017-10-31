//
//  MenuTableViewController.swift
//  True Flavor
//
//  Created by Adam Birdsall on 10/30/17.
//  Copyright © 2017 Adam Birdsall. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class MenuTableViewController: UITableViewController {

    var beefRef = FIRDatabase.database().reference(withPath: "menu/Beef")
    var chickenRef = FIRDatabase.database().reference(withPath: "menu/Chicken")
    var turkeyRef = FIRDatabase.database().reference(withPath: "menu/Turkey")
    var veggieRef = FIRDatabase.database().reference(withPath: "menu/Veggie")

    
    var beefItems: [MealObject] = []
    var chickenItems: [MealObject] = []
    var turkeyItems: [MealObject] = []
    var veggieItems: [MealObject] = []
    
    let sectionHeaderTitles: [String] = ["Beef", "Chicken", "Turkey", "Veggie"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loadDataFromFirebase()
    }

    func loadDataFromFirebase() {
        
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        
        /*
         * Query data
         */
        beefRef.queryOrdered(byChild: "Price").observe(.value, with: { (snapshot) in
            
            var tempItems = [MealObject]()
            
            for item in (snapshot.children) {
                let mealObjects = NewMeal(snapshot: item as! FIRDataSnapshot)
                let newMeal:MealObject = MealObject()
                
                newMeal.name = mealObjects.name
                newMeal.description = mealObjects.description
                newMeal.price = mealObjects.price
                
                tempItems.append(newMeal)
            }
            
            self.beefItems = tempItems
            self.tableView.reloadData()
            
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
        })
        
        chickenRef.queryOrdered(byChild: "Price").observe(.value, with: { (snapshot) in
            
            var tempItems = [MealObject]()
            
            for item in (snapshot.children) {
                let mealObjects = NewMeal(snapshot: item as! FIRDataSnapshot)
                let newMeal:MealObject = MealObject()
                
                newMeal.name = mealObjects.name
                newMeal.description = mealObjects.description
                newMeal.price = mealObjects.price
                
                tempItems.append(newMeal)
            }
            
            self.chickenItems = tempItems
            self.tableView.reloadData()
            
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
        })
        
        turkeyRef.queryOrdered(byChild: "Price").observe(.value, with: { (snapshot) in
            
            var tempItems = [MealObject]()
            
            for item in (snapshot.children) {
                let mealObjects = NewMeal(snapshot: item as! FIRDataSnapshot)
                let newMeal:MealObject = MealObject()
                
                newMeal.name = mealObjects.name
                newMeal.description = mealObjects.description
                newMeal.price = mealObjects.price
                
                tempItems.append(newMeal)
            }
            
            self.turkeyItems = tempItems
            self.tableView.reloadData()
            
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
        })
        
        veggieRef.queryOrdered(byChild: "Price").observe(.value, with: { (snapshot) in
            
            var tempItems = [MealObject]()
            
            for item in (snapshot.children) {
                let mealObjects = NewMeal(snapshot: item as! FIRDataSnapshot)
                let newMeal:MealObject = MealObject()
                
                newMeal.name = mealObjects.name
                newMeal.description = mealObjects.description
                newMeal.price = mealObjects.price
                
                tempItems.append(newMeal)
            }
            
            self.veggieItems = tempItems
            self.tableView.reloadData()
            
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
        })
    }
    
    
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let header = sectionHeaderTitles[section] as String?
        
        return header
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 4
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        let sectionHeader = sectionHeaderTitles[section]
        
        switch sectionHeader {
            
        case "Beef":
            return self.beefItems.count
            
        case "Chicken":
            return self.chickenItems.count
            
        case "Turkey":
            return self.turkeyItems.count
            
        case "Veggie":
            return self.veggieItems.count
            
        default:
            return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let sectionTitle = sectionHeaderTitles[indexPath.section]
        var sectionItems = [MealObject]()
        
        switch sectionTitle {
        case "Beef":
            sectionItems = self.beefItems
            break
        case "Chicken":
            sectionItems = self.chickenItems
            break
        case "Turkey":
            sectionItems = self.turkeyItems
            break
        case "Veggie":
            sectionItems = self.veggieItems
            break
        default:
            break
        }

        // Configure the cell...
        cell.textLabel?.text = sectionItems[indexPath.row].name
        cell.detailTextLabel?.text = sectionItems[indexPath.row].price

        return cell
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "viewDetails") {
            
            let destination = segue.destination as! DetailsViewController
            
            let indexPath = self.tableView.indexPathForSelectedRow!
            
            let sectionTitle = sectionHeaderTitles[indexPath.section]
            var sectionItems = [MealObject]()
            
            switch sectionTitle {
            case "Beef":
                sectionItems = self.beefItems
                break
            case "Chicken":
                sectionItems = self.chickenItems
                break
            case "Turkey":
                sectionItems = self.turkeyItems
                break
            case "Veggie":
                sectionItems = self.veggieItems
                break
            default:
                break
            }
            
            
            // get object from your dataparse array using the indexPath
            destination.titleString = sectionItems[indexPath.row].name
            destination.priceString = sectionItems[indexPath.row].price
            destination.descriptionString = sectionItems[indexPath.row].description
        }
    }
 

}
