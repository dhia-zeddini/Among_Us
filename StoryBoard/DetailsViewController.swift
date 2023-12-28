//
//  DetailsViewController.swift
//  StoryBoard
//
//  Created by Zeddin Dhia on 28/12/2023.
//

import UIKit
import CoreData

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
        var mBoolean=false
        
        let appDelegate=UIApplication.shared.delegate as! AppDelegate
        let persistentContainer=appDelegate.persistentContainer
        let managedContext=persistentContainer.viewContext
        
        let request=NSFetchRequest<NSManagedObject>(entityName: "Player")
        let predicate=NSPredicate(format: "name = %@", playerName!)
        request.predicate=predicate
        
        do{
           let result = try managedContext.fetch(request)
            if result.count>0{
                mBoolean=true
            }

        }catch{
            print("suspect fetching error")
        }
        
        return mBoolean
    }
    
    //core data
    
    func addPlayer() {
        let appDelegate=UIApplication.shared.delegate as! AppDelegate
        let persistentContainer=appDelegate.persistentContainer
        let managedContext=persistentContainer.viewContext
        
        let entityDescription=NSEntityDescription.entity(forEntityName: "Player", in: managedContext)
        let object=NSManagedObject(entity: entityDescription!, insertInto: managedContext)
        object.setValue(playerName, forKey: "name")
        object.setValue(playerColor, forKey: "color")
        
        do{
            try managedContext.save()
            self.showAlert(title: "Success", message: "Player is marked as suspect")
        }catch{
            print("suspect adding error")
        }
    }
    
    func showAlert(title:String,message:String) {
        let alert=UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true)
    }
    
    //IBActions
    
    @IBAction func suspect(_ sender: Any) {
        
        if(!isSuspect()){
            
            addPlayer()
            
        }else{
            self.showAlert(title: "Warning", message: "Player already marked as suspect")
        }
    }
    
}
