//
//  peopleFlowViewController.swift
//  QRcode
//
//  Created by Anson on 27/3/2018.
//  Copyright © 2018年 HKRedCross. All rights reserved.
//

import UIKit
import Firebase

class peopleFlowViewController: UIViewController , UIPickerViewDataSource,
UIPickerViewDelegate{
    
    var ref: DatabaseReference!
    var selectBcName = ""
    
    let bcname = ["Headquarters Donor Centre",
                  "West Kowloon Donor Centre",
                  "Mongkok Donor Centre",
                  "Kwun Tong Donor Centre",
                  "Central District Donor Centre",
                  "Causeway Bay Donor Centre",
                  "Shatin Donor Centre",
                  "Tsuen Wan Donor Centre",
                  "Yuen Long Donor Centre",
                  "The Hong Kong Polytechnic University Campus Blood Donor Centre",
                  "The University of Hong Kong Campus Blood Donor Centre"]
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return bcname.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return bcname[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectBcName = bcname[row]
    }

    @IBOutlet var bcPicker: UIPickerView!
    @IBOutlet weak var peopleFlowNum: UILabel!
    
    @IBAction func peopleFlowSlider(_ sender: UISlider) {
        peopleFlowNum.text = String(Int(sender.value))
    }
    override func viewDidLoad() {
        bcPicker.delegate = self
        bcPicker.dataSource = self
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        ref = Database.database().reference()
        ref.child("peopleflow").observeSingleEvent(of: .value, with: { (snapshot) in
            for child in snapshot.children {
                let snap = child as! DataSnapshot
                let key = snap.key
                let value = snap.value
                print("key = \(key)  value = \(value!)")
            }
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func update(_ sender: UIButton) {
        let num = peopleFlowNum.text
        ref = Database.database().reference()
        ref.child("peopleflow").child(selectBcName).setValue(num)
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
