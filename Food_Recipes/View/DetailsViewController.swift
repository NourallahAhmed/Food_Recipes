//
//  DetailsViewController.swift
//  Food_Recipes
//
//  Created by NourAllah Ahmed on 5/7/22.
//  Copyright © 2022 NourAllah Ahmed. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController  , UITableViewDataSource, UITableViewDelegate {
   
    

    @IBOutlet weak var stepsTable: UITableView!
    
    var analyzedInstructions : [Results.AnalyzedInstructions]?
//    var steps : [AnalyzedInstructions.Steps]?
    override func viewDidLoad() {
        super.viewDidLoad()
    
        stepsTable.delegate = self
        stepsTable.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return analyzedInstructions?.count ?? 0
       }
       
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tablecell", for: indexPath) as? StepsTableViewCell
        var step = analyzedInstructions?.first?.steps
        cell?.Step.text = String(format:"%.2d", step?[indexPath.row].number ?? 0)
        cell?.stepDetails.text = String(step?[indexPath.row].step ?? " ")
        return cell!
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
