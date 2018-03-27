//
//  personalInformViewController.swift
//  QRcode
//
//  Created by Anson on 27/3/2018.
//  Copyright © 2018年 HKRedCross. All rights reserved.
//

import UIKit
import Firebase

class personalInformViewController: UIViewController {
    @IBOutlet weak var fName: UITextField!
    @IBOutlet weak var lname: UITextField!
    @IBOutlet weak var chName: UITextField!
    @IBOutlet weak var HKID: UITextField!
    @IBOutlet weak var DOB: UITextField!
    @IBOutlet weak var weight: UITextField!
    @IBOutlet weak var Height: UITextField!
    @IBOutlet weak var bGroup: UITextField!
    @IBOutlet weak var DID: UITextField!
    @IBOutlet weak var HKhave: UISegmentedControl!
    @IBOutlet weak var lastDdate: UITextField!
    
    var url:String?
    
    
    override func viewDidLoad() {
        let urlToDisplay = url
        fName.text = urlToDisplay

        print("page = \(String(describing: urlToDisplay))")
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
