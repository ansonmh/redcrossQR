//
//  photoViewController.swift
//  QRcode
//
//  Created by Anson on 28/3/2018.
//  Copyright © 2018年 HKRedCross. All rights reserved.
//

import UIKit

class photoViewController: UIViewController {
    var takenPhoto:UIImage?
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let availabeleImage = takenPhoto{
            imageView.image = availabeleImage
        }
        // Do any additional setup after loading the view.
    }
    @IBAction func goBack(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
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
