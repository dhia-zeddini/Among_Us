//
//  ViewController.swift
//  StoryBoard
//
//  Created by Zeddin Dhia on 28/12/2023.
//

import UIKit

class ViewController: UIViewController {
    //var
    
    
    
    
    //widgets
    
    
    @IBOutlet weak var avatarImageV: UIImageView!
    
    @IBOutlet weak var userNameTf: UITextField!
    
    
    
    
    //life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    //methods
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier=="firstSegue"{
            let destination=segue.destination as! HomeViewController
            destination.avatarName=userNameTf.text
        }
    }
    
    
    //IbActions


    @IBAction func startAction(_ sender: Any) {
        
        performSegue(withIdentifier: "firstSegue", sender: sender)
    }
    
    
    @IBAction func redBtn(_ sender: Any) {
        avatarImageV.image=UIImage(named: "Red")
    }
    
    @IBAction func yellowBtn(_ sender: Any) {
        avatarImageV.image=UIImage(named: "Yellow")

    }
    
    @IBAction func brownBtn(_ sender: Any) {
        avatarImageV.image=UIImage(named: "Brown")

    }
    
    @IBAction func lightBlueBtn(_ sender: Any) {
        avatarImageV.image=UIImage(named: "Light-blue")

    }
    @IBAction func orangeBtn(_ sender: Any) {
        avatarImageV.image=UIImage(named: "Orange")

    }
    
    
    @IBAction func purpleBtn(_ sender: Any) {
        avatarImageV.image=UIImage(named: "Purple")

    }
    
    
    @IBAction func pinkBtn(_ sender: Any) {
        avatarImageV.image=UIImage(named: "Rose")

    }
    
}

