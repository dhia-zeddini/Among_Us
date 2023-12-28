//
//  DetailsViewController.swift
//  StoryBoard
//
//  Created by Zeddin Dhia on 28/12/2023.
//

import UIKit

class DetailsViewController: UIViewController {
    
    
    //var
    var playerName:String?
    var playerColor:String?
    
    //widgets

    @IBOutlet weak var playerAvatar: UIImageView!
    
    //life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title=playerName!

        playerAvatar.image=UIImage(named: playerColor!)
    }
    

    //methods
    func isSuspect() -> Bool {
        return true
    }
    
    func showAlert(title:String,message:String) {
        let alert=UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true)
    }
    
    //IBActions
    
    @IBAction func suspect(_ sender: Any) {
        
        if(isSuspect()){
            
            
            
        }else{
            self.showAlert(title: "Warning", message: "Player already marked as suspect")
        }
    }
    
}
