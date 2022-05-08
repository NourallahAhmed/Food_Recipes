//
//  HomeViewController.swift
//  Food_Recipes
//
//  Created by NourAllah Ahmed on 5/7/22.
//  Copyright © 2022 NourAllah Ahmed. All rights reserved.
//

import UIKit
import CoreData
import Network
import Kingfisher
class HomeViewController: UIViewController
    ,UITableViewDataSource ,UITableViewDelegate
{
    
    
    
    
    //MARK: storyboard
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var homeCollectionView: UICollectionView!
    
    @IBOutlet weak var myTable: UITableView!
    
    //MARK: DATA
    var results : [Results]?
    
    //MARK: for network
    var myNetworkDelegate = NetworkDelegate()
    let monitor = NWPathMonitor()
    let queue = DispatchQueue(label: "InternetConnectionMonitor")
    
    let myIndicator = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.gray)
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK: try animated splash screen
        
        
        myTable.delegate = self
        myTable.dataSource = self
        print("why")
        //        self.homeCollectionView.delegate = self
        //        self.homeCollectionView.dataSource = self
        //MARK: NetworkIndecator
        myIndicator.center = self.view.center
        self.view.addSubview(myIndicator)
        myIndicator.startAnimating()
        // MARK: check network
        monitor.pathUpdateHandler = { pathUpdateHandler  in
            if pathUpdateHandler.status == .satisfied {
                print("Internet connection is on.")
                self.myNetworkDelegate.getAlamoFire(completion:{ (re) in
                    DispatchQueue.main.async {
                        self.myIndicator.stopAnimating()
                        self.results = re
                        //                        self.homeCollectionView.reloadData()
                        self.myTable.reloadData()
                    }
                })
                
                
            }else{
                print("no internet")
            }}
        
        monitor.start(queue: queue)
        
    }
    
    //MARK:- TableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? TableViewCell
        
        
        cell?.foodTitleLabel.text = String("Title: ") + String( results?[indexPath.row].title ?? " ")
        //               cell?.foodSummaryLabel.text = " "//results?[indexPath.row].summary!
        cell?.foodHealthScoreLabel.text =  String("Health Score: ") + String(format: "%.2d" , results?[indexPath.row].healthScore ?? 0) + String(" %")
//        cell?.foodDishTypeLabel.text = String("Dish Type :") + String(results?[indexPath.row].dishTypes?.description ?? " ")
        let image = UIImage(named: "default.png")
        cell?.foodImageView?.image = image
        let url = URL(string: results?[indexPath.row].image ?? " ")
        cell?.foodImageView?.kf.setImage(with: url, placeholder: image, options: nil, progressBlock: nil)
        
        
        return cell!
    }
    /*
     
     func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
     return results?.count ?? 0
     }
     
     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
     let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? FoodCollectionViewCell
     
     
     cell?.foodTitleLabel.text = String("Title: ") + String( results?[indexPath.row].title ?? " ")
     cell?.foodSummaryLabel.text = " "//results?[indexPath.row].summary!
     cell?.foodHealthScoreLabel.text =  String("Health Score: ") + String(format: "%.2d" , results?[indexPath.row].healthScore ?? 0) + String(" %")
     cell?.foodDishTypeLabel.text = String("Dish Type :") + String(results?[indexPath.row].dishTypes?.first ?? " ")
     let image = UIImage(named: "default.png")
     cell?.foodImageView?.image = image
     let url = URL(string: results?[indexPath.row].image ?? " ")
     cell?.foodImageView?.kf.setImage(with: url, placeholder: image, options: nil, progressBlock: nil)
     
     print("hiiiii")
     
     return cell!
     }
     
     
     */
    
    //    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    //
    //        var selected = results?[indexPath.row]
    //        print("the next \(selected)")
    //        var DVC = self.storyboard?.instantiateViewController(withIdentifier: "DVC") as! DetailsViewController
    //        DVC.analyzedInstructions = results?[indexPath.row].analyzedInstructions
    //        self.navigationController?.pushViewController(DVC, animated: true)
    
    //    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //  Get the new view controller using segue.destination.
        //  Pass the selected object to the new view controller.
        var index = myTable.indexPathForSelectedRow
        print("hiiiii")
        var DVC : DetailsViewController  = segue.destination as! DetailsViewController
        print(results?[index!.row].analyzedInstructions?.first?.steps)
        DVC.receivedResult = results?[index!.row]
    }
    //
}
