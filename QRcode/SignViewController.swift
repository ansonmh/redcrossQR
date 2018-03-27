//
//  SignViewController.swift
//  QRcode
//
//  Created by Anson on 28/3/2018.
//  Copyright © 2018年 HKRedCross. All rights reserved.
//

import UIKit

class SignViewController: UIViewController {

    @IBOutlet weak var signView: UIView!
    
    var path = UIBezierPath()
    var startPoint = CGPoint()
    var touchPoint = CGPoint()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        signView.clipsToBounds = true
        signView.isMultipleTouchEnabled = false
        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        if let point = touch?.location(in: signView){
            startPoint = point
        }
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        if let point = touch?.location(in: signView){
            touchPoint = point
        }
        
        path.move(to: startPoint)
        path.addLine(to: touchPoint)
        startPoint = touchPoint
        
        draw()
    }
    
    func draw() {
        let strokeLayer = CAShapeLayer()
        strokeLayer.fillColor = nil
        strokeLayer.lineWidth = 5
        strokeLayer.strokeColor = UIColor.black.cgColor
        strokeLayer.path = path.cgPath
        signView.layer.addSublayer(strokeLayer)
        signView.setNeedsDisplay()
    }

    @IBAction func clean(_ sender: UIButton) {
        path.removeAllPoints()
        signView.layer.sublayers = nil
        signView.setNeedsDisplay()
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
