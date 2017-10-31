//
//  DetailsViewController.swift
//  True Flavor
//
//  Created by Adam Birdsall on 10/30/17.
//  Copyright © 2017 Adam Birdsall. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var placeOrderButton: UIButton!
    
    var titleString: String = ""
    var priceString: String = ""
    var descriptionString: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.titleLabel.text = titleString
        self.priceLabel.text = "$\(priceString)"
        self.descriptionTextView.text = descriptionString

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func placeOrder(_ sender: Any) {
        
        let alertController = UIAlertController(title: "Order Placed!", message: "", preferredStyle: UIAlertControllerStyle.alert)
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel) { (result : UIAlertAction) -> Void in }
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
