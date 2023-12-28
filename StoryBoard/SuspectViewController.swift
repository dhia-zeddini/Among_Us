//
//  SuspectViewController.swift
//  StoryBoard
//
//  Created by Zeddin Dhia on 28/12/2023.
//

import UIKit
import CoreData

class SuspectViewController: UIViewController ,UICollectionViewDataSource{

    
    
    //var
    var suspects=[String]()
    var suspectsColors=[String]()
    
    
    
    
    //widgets
    
    
    @IBOutlet weak var mCollectionView: UICollectionView!
    
    
    //collectionview
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return suspects.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
        let cell=collectionView.dequeueReusableCell(withReuseIdentifier: "mItem", for: indexPath)
        let cv=cell.contentView
        
        let imageView=cv.viewWithTag(1) as! UIImageView
        let label=cv.viewWithTag(2) as! UILabel
        
        imageView.image=UIImage(named: suspectsColors[indexPath.row])
        label.text=suspects[indexPath.row]
        
        return cell
    }
    
    
    //life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        mCollectionView.reloadData()

        // Do any additional setup after loading the view.
        fetchSuspects()
    }
    

  //methods
    
    func fetchSuspects()  {
        
        let appDelegate=UIApplication.shared.delegate as! AppDelegate
        let persistentContainer=appDelegate.persistentContainer
        let managedContext=persistentContainer.viewContext
        
        let request=NSFetchRequest<NSManagedObject>(entityName: "Player")
        
        do{
           let result = try managedContext.fetch(request)
            for item in result{
                suspects.append(item.value(forKey: "name") as! String)
                print(item.value(forKey: "name") as! String)
                suspectsColors.append(item.value(forKey: "color") as! String)
            }

        }catch{
            print("suspect fetching error")
        }
    }

}
