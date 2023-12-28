//
//  SuspectViewController.swift
//  StoryBoard
//
//  Created by Zeddin Dhia on 28/12/2023.
//

import UIKit
import CoreData

class SuspectViewController: UIViewController ,UICollectionViewDataSource,UICollectionViewDelegate{

    
    
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
    
    //cell select
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
          let selectedSuspect = suspects[indexPath.row]

          let confirmationAlert = UIAlertController(title: "Delete Suspect", message: "Are you sure you want to delete \(selectedSuspect)?", preferredStyle: .alert)

          confirmationAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))

          confirmationAlert.addAction(UIAlertAction(title: "OK", style: .destructive, handler: { [weak self] _ in
              // Delete the suspect from Core Data
              self?.deleteSuspectFromCoreData(at: indexPath.row)

              // Remove the suspect from the arrays
              self?.suspects.remove(at: indexPath.row)
              self?.suspectsColors.remove(at: indexPath.row)

              // Reload the collection view to reflect the changes
              self?.mCollectionView.reloadData()
          }))

          present(confirmationAlert, animated: true, completion: nil)
      }
    //life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
//        mCollectionView.reloadData()

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
    
    
    func deleteSuspectFromCoreData(at index: Int) {
         let appDelegate = UIApplication.shared.delegate as! AppDelegate
         let persistentContainer = appDelegate.persistentContainer
         let managedContext = persistentContainer.viewContext

         let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Player")
         request.predicate = NSPredicate(format: "name == %@", suspects[index])

         do {
             let result = try managedContext.fetch(request)
             if let objectToDelete = result.first as? NSManagedObject {
                 managedContext.delete(objectToDelete)

                 // Save the changes
                 try managedContext.save()
             }
         } catch {
             print("Error deleting suspect from Core Data: \(error)")
         }
     }

}
