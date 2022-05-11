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
class HomeViewController: UIViewController {
    
    //MARK: storyboard
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var homeCollectionView: UICollectionView!
    
    @IBOutlet weak var myTable: UITableView!
    
    @IBOutlet weak var searchBar: UISearchBar!
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
        myTable.separatorStyle = .none
        myTable.showsVerticalScrollIndicator = false
        searchBar.delegate = self
        
        //MARK: NetworkIndecator
        myIndicator.center = self.view.center
        self.view.addSubview(myIndicator)
        myIndicator.startAnimating()
        // MARK: check network
        monitor.pathUpdateHandler = { pathUpdateHandler  in
            if pathUpdateHandler.status == .satisfied {
                print("Internet connection is on.")
                self.sendRequest(query: "")
            }
            else{
                print("No Internet Connection")
                self.showAlert(query: "")
            }
        }
        
        monitor.start(queue: queue)
        
    }
    //MARK: - send query to showAlert to  resend request in the handler of alert Action (( in case the connection becomes on))

    func showAlert(query:String){
        DispatchQueue.main.async {
            let alert : UIAlertController = UIAlertController(title: "ERROR", message: "Please check your internet connection", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .destructive, handler: { action in
                self.sendRequest(query: query)} ))
            self.present(alert , animated: true , completion: nil)
        }
        
    }
    
    func sendRequest(query:String){
        self.myNetworkDelegate.getAlamoFire(query: query,completion:{ (re) in
            DispatchQueue.main.async {
                self.myIndicator.stopAnimating()
                self.results = re
                self.myTable.reloadData()
            }})
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //  Get the new view controller using segue.destination.
        //  Pass the selected object to the new view controller.
        let index = myTable.indexPathForSelectedRow
        let DVC : DetailsViewController  = segue.destination as! DetailsViewController
        DVC.receivedResult = results?[index!.row]
    }
    //
}


extension HomeViewController : UITableViewDataSource,UITableViewDelegate{
    
    
    //MARK:- TableView
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? myTableViewCell
        
        var temp : Results?
        
        cell?.foodTitleLabel.text = String( results?[indexPath.row].title ?? "nil")
        cell?.foodDurrationLabel.text = String(format: "%.2d" , results?[indexPath.row].readyInMinutes ?? 0)
        cell?.foodHealthScoreLabel.text = String(format: "%.2d" , results?[indexPath.row].healthScore ?? 0) + String(" %")
        cell?.foodDishTypeLabel.text = String(results?[indexPath.row].dishTypes?.first ?? "nil")
        let image = UIImage(named: "default.png")
        cell?.foodImageView?.image = image
        
        let imageId = results?[indexPath.row].id
        let imageType = results?[indexPath.row].imageType
        let imageURL = URL(string: "https://spoonacular.com/recipeImages/\(imageId!)-636x393.\(imageType!)")
        let url = URL(string: results?[indexPath.row].image ?? " ")
        cell?.foodImageView?.kf.setImage(with: imageURL, placeholder: image, options: nil, progressBlock: nil)
        
        //try
        //        cell?.backView.layer.cornerRadius = cell?.contentView.frame.height ?? 0  / 2
        //        cell?.backView.layer.cornerRadius = cell?.foodImageView.frame.height ?? 0 / 2
        
        return cell!
    }
}
extension HomeViewController : UISearchBarDelegate{
    
    //MARK: -Search Bar
    // This method updates filteredData based on the text in the Search Box
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
        self.myIndicator.startAnimating()
        self.monitor.pathUpdateHandler = { pathUpdateHandler  in
            if pathUpdateHandler.status == .satisfied {
                print("Internet connection is on.")
                self.sendRequest(query: searchText)
            }
            else{
                print("No Internet Connection")
                self.showAlert(query: searchText)
            }
        }
        monitor.start(queue: queue)
    }
    
    
}
