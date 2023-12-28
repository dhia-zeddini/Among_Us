//
//  HomeViewController.swift
//  StoryBoard
//
//  Created by Zeddin Dhia on 28/12/2023.
//

import UIKit

class HomeViewController: UIViewController ,UITableViewDelegate, UITableViewDataSource{
   
    
    
    //var
    var avatarName:String?

    var players=["Hu5tl3r", "MC_Killer", "CR7", "Not_Impostor", "BabyShark", "AKINFENWA", "DR'Who"]
    var playerrsColors=["Red","Orange","Brown","Rose","Yellow","Light-blue","Purple"]
    
    //widgets
    
    @IBOutlet weak var helloLabel: UILabel!
    
    @IBOutlet weak var playersTv: UITableView!
    
    //TableView
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        return players.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell=tableView.dequeueReusableCell(withIdentifier: "mCell")
        let cv=cell?.contentView
        
        let playerAvatar=cv?.viewWithTag(1) as! UIImageView
        let playerName=cv?.viewWithTag(2) as! UILabel
        let playerColor=cv?.viewWithTag(3) as! UILabel
        
        playerAvatar.image=UIImage(named: playerrsColors[indexPath.row])
        playerName.text=players[indexPath.row]
        playerColor.text=playerrsColors[indexPath.row]
        
        return cell!
    }
    
    //cell select
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
        performSegue(withIdentifier: "secondSegue", sender: indexPath)
    }
    
    // this method handles row deletion
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {

        if editingStyle == .delete {

          
                players.remove(at: indexPath.row)
                playerrsColors.remove(at: indexPath.row)

                // Delete the table view row
                tableView.deleteRows(at: [indexPath], with: .fade)
          

         }
     }
    
   /* func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {

        // action one
        let editAction = UITableViewRowAction(style: .default, title: "Edit", handler: { (action, indexPath) in
            print("Edit tapped")
        })
        editAction.backgroundColor = UIColor.blue

        // action two
        let deleteAction = UITableViewRowAction(style: .default, title: "Delete", handler: { (action, indexPath) in
            print("Delete tapped")
        })
        deleteAction.backgroundColor = UIColor.red

        return [editAction, deleteAction]
    }*/
    
    //life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        helloLabel.text="Hello "+avatarName!
    }
    
    //methods
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier=="secondSegue"{
            let index=sender as! IndexPath
            let destination=segue.destination as! DetailsViewController
            destination.playerName=players[index.row]
            destination.playerColor=playerrsColors[index.row]
        }
    }

    
    //IBActions
    
    
    @IBAction func emergencyBtn(_ sender: Any) {
        
        performSegue(withIdentifier: "thirdSegue", sender: sender)
    }
    
}
