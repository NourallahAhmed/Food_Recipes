//
//  DetailsViewController.swift
//  Food_Recipes
//
//  Created by NourAllah Ahmed on 5/7/22.
//  Copyright © 2022 NourAllah Ahmed. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController{
    
    
    
    @IBOutlet weak var stepsTable: UITableView!
    @IBOutlet weak var recipeImage: UIImageView!
    @IBOutlet weak var segmentalOutlet: UISegmentedControl!
    
    var receivedResult : Results?
    var segmentalResult:Int?
      
      
    override func viewDidLoad() {
        super.viewDidLoad()
        
        stepsTable.delegate = self
        stepsTable.dataSource = self
        stepsTable.separatorStyle = .singleLine
        
        let imageId = receivedResult?.id
        let imageType = receivedResult?.imageType
        let imageURL = URL(string: "https://spoonacular.com/recipeImages/\(imageId!)-556x370.\(imageType!)")
        
        
        print("url reciepe : https://spoonacular.com/recipeImages/\(imageId!)-556x370.\(imageType!)")
        let image = UIImage(named: "default.png")
        recipeImage?.image = image
        recipeImage.kf.setImage(with: imageURL, placeholder: image, options: nil, progressBlock: nil)
        segmentalOutlet.selectedSegmentIndex = 0
        self.segmentalAction(segmentalOutlet)
        stepsTable.reloadData()
      
    }
    
    
    @IBAction func segmentalAction(_ sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex {
        case 0:
            segmentalResult = 0
            stepsTable.reloadData()
        case 1:
            segmentalResult = 1
            stepsTable.reloadData()
        default:
           break
        }
    }
      /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
extension DetailsViewController :  UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        var theReturnValue :Int = 0
        switch segmentalResult
        {
        case 0:
            print("this is a try!")
            theReturnValue = receivedResult?.extendedIngredients?.count ?? 0
        case 1:
            theReturnValue = receivedResult?.analyzedInstructions?.first?.steps?.count ?? 0
        default:
            break
        }
        return theReturnValue
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        
        switch segmentalResult
        {
        case 0:
            print("the ingredients!")
            let cell = tableView.dequeueReusableCell(withIdentifier: "tablecell", for: indexPath) as? StepsTableViewCell
            
            
            let ingredient = receivedResult?.extendedIngredients?[indexPath.row]
            
            //MARK:  name
            cell?.Step.text = String(ingredient?.name ?? " ")
            //MARK: amount
            cell?.stepsDetails.text = String("Amount : ") + String(format: "%.2f" , ingredient?.amount ?? 0.0) + String(" ") + String(ingredient?.unit ?? " ")
            
            let image = UIImage(named: "default.png")
            cell?.myImageView?.image = image
            let imagename = ingredient?.image
            var url : URL?
            if imagename != nil {
                url = URL(string:"https://spoonacular.com/cdn/ingredients_100x100/\(imagename!)")
            }
            
            // print("url = https://spoonacular.com/cdn/ingredients_100x100/\(imagename! )")
            cell?.myImageView?.kf.setImage(with: url, placeholder: image, options: nil, progressBlock: nil)
            
            return cell!
        case 1:
            print("the steps")
            let cell = tableView.dequeueReusableCell(withIdentifier: "tablecell", for: indexPath) as? StepsTableViewCell
            
            
            let step = receivedResult?.analyzedInstructions?.first?.steps
            cell?.Step.text = String("Step  ") + String(format:"%.2d", step?[indexPath.row].number ?? 0)
            cell?.stepsDetails.text =  String(step?[indexPath.row].step ?? " ")
            let image = UIImage(named: "default.png")
            cell?.myImageView?.image = image
            let imagename = step?[indexPath.row].ingredients?.first?.image
            var url : URL?
            if imagename != nil {
                url = URL(string:"https://spoonacular.com/cdn/ingredients_100x100/\(imagename!)")
            }
            else{
                let eqimagename = step?[indexPath.row].equipment?.first?.image
                url = URL(string: "https://spoonacular.com/cdn/equipment_100x100/\(String(describing: eqimagename))")
            }
            
            //print("url = https://spoonacular.com/cdn/ingredients_100x100/\(imagename! )")
            cell?.myImageView?.kf.setImage(with: url, placeholder: image, options: nil, progressBlock: nil)
            
            return cell!
        default:
            break
        }
        
        return UITableViewCell()
    }
    
    
}
