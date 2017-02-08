//
//  ViewController.swift
//  Tipster
//
//  Created by Das Beard on 2/8/17.
//  Copyright © 2017 dasBeard. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var total = ""
    var group = 1
    var decimals = 0
    var tipAmount = 0
    var smallTipPerc:Float = 0.0
    var mediumTipPerc:Float = 0.0
    var largeTipPerc:Float = 0.0
    var flag = false
    var dec = 0
    var change = false
    
    @IBAction func calcButton(_ sender: UIButton) {
        print(sender.tag)

        if dec < 3 {
        
            if sender.tag == 0{
                if total == ""{
                } else {
                total.append("0")
                }
            } else if sender.tag == 1{
                total.append("1")
            } else if sender.tag == 2{
                total.append("2")
            } else if sender.tag == 3{
                total.append("3")
            } else if sender.tag == 4{
                total.append("4")
            } else if sender.tag == 5{
                total.append("5")
            } else if sender.tag == 6{
                total.append("6")
            } else if sender.tag == 7{
                total.append("7")
            } else if sender.tag == 8{
                total.append("8")
            } else if sender.tag == 9{
                total.append("9")
            } else if sender.tag == 11{
                if total == "" || total == "0"{
//                    total.append(".")
                    flag = true
                    total = "0."
                } else {
                    total.append(".")
                    flag = true
                }
            }
            
            if total == ""{
                sumLabel.text = "0"
            } else {
                sumLabel.text = total
              updateUI()
            }
            
            if flag == true{
                dec += 1
            }
        }
        

        
        if sender.tag == 10{     //Clear button
            total = "0"
            flag = false
            change = false
            dec = 0
            updateUI()
            total = ""
            sumLabel.text = "0"
        }

        
    }

    @IBAction func slider(_ sender: UISlider) {
        // Tip Slider Tag = 0
        // Group Slider Tag = 1
        
        
        if sender.tag == 1{
            group = Int(sender.value)
            groupSizeLabel.text = String(group)
            if total != ""{
                updateUI()
            }
        }
        if sender.tag == 0{
            tipAmount = Int(sender.value)
            smallTipPercLabel.text = String(tipAmount) + "%"
            mediumTipPercLabel.text = String(tipAmount + 5) + "%"
            largeTipPercLabel.text = String(tipAmount + 10) + "%"
            if total != ""{
                updateUI()
            }
        }
        
        
        

    }
    
    @IBOutlet weak var sumLabel: UILabel!
    
    @IBOutlet weak var groupSizeLabel: UILabel!

    @IBOutlet weak var smallTipPercLabel: UILabel!
    @IBOutlet weak var mediumTipPercLabel: UILabel!
    @IBOutlet weak var largeTipPercLabel: UILabel!
    
    @IBOutlet weak var smallTipAmountLabel: UILabel!
    @IBOutlet weak var mediumTipAmountLabel: UILabel!
    @IBOutlet weak var largeTipAmountLabel: UILabel!
    
    @IBOutlet weak var smallTipTotalLabel: UILabel!
    @IBOutlet weak var mediumTipTotalLabel: UILabel!
    @IBOutlet weak var largeTipTotalLabel: UILabel!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        smallTipPercLabel.text = String(tipAmount) + "%"
        mediumTipPercLabel.text = String(tipAmount + 5) + "%"
        largeTipPercLabel.text = String(tipAmount + 10) + "%"
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    
    func updateUI(){
        
        smallTipPerc = (Float(tipAmount) / Float(100)) * Float(total)! / Float(group)
        mediumTipPerc = (Float(tipAmount + 5) / Float(100)) * Float(total)! / Float(group)
        largeTipPerc = (Float(tipAmount + 10) / Float(100)) * Float(total)! / Float(group)
        
        smallTipAmountLabel.text = String(format: "%.2f", smallTipPerc)
        mediumTipAmountLabel.text = String(format: "%.2f", mediumTipPerc)
        largeTipAmountLabel.text = String(format: "%.2f", largeTipPerc)
        
        smallTipTotalLabel.text = String(format: "%.2f", smallTipPerc + Float(total)! / Float(group))
        mediumTipTotalLabel.text = String(format: "%.2f", mediumTipPerc + Float(total)! / Float(group))
        largeTipTotalLabel.text = String(format: "%.2f", largeTipPerc + Float(total)! / Float(group))
        
    }
    
    
    
}

