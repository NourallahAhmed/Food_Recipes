//
//  NetworkDelegate.swift
//  Food_Recipes
//
//  Created by NourAllah Ahmed on 5/7/22.
//  Copyright © 2022 NourAllah Ahmed. All rights reserved.
//

import Foundation

import Alamofire
import Kingfisher

//https://api.spoonacular.com/recipes/complexSearch?apiKey=dbf6bff012ad44bfad9b5b5582c6f963&fillIngredients=true&addRecipeInformation=true&?&query=
class NetworkDelegate {

       func getRequest(complitionHandler: @escaping  (RootClass?) -> Void ){
        
        // 1 URL
        let myUrl = URL(string: "https://api.spoonacular.com/recipes/complexSearch?apiKey=dbf6bff012ad44bfad9b5b5582c6f963&fillIngredients=true&addRecipeInformation=true&?&query=pizza")
        guard let newUrl = myUrl else {
            print("Error while unwrapping URL")
            return
        }
        // 2 Request
        let myRequest = URLRequest(url: newUrl)
        
        // 3 session
        
        let mySession = URLSession(configuration: .default)
        // 4 task
        print("before task")
        let myTask = mySession.dataTask(with: myRequest) { (rdata, response, error) in
            guard let data =  rdata else
            {
                print("data from guard : \(String(describing: rdata))")
                return
                
            }
            do {
                
                let result = try JSONDecoder().decode(RootClass.self, from: data)
            
                complitionHandler(result)
            }
            catch let error{
                print("error : \(error.localizedDescription)")
                complitionHandler(nil)

            }
        }
        
        
        // 5 resume
        
        myTask.resume()
    }
    
    
    
    //MARK: using AlamoFire
    
    func getAlamoFire( query :String? , completion: @escaping ([Results]?) -> Void){
        //API_KEYS:
        //a95ffa16319749bc9c991d79da9e274c (gweda)
        //dbf6bff012ad44bfad9b5b5582c6f963 (ana)
        //7994c04921934c3ca7b2c8a5ec1e1d51 (ITI)
        //a7f2147152a342bfa5c00a841dfe9e49  (nerdeen)
        let parameters = ["query" : query ?? " "] as [String : String]
        //&query=pizza
        // 1 request
        AF.request("https://api.spoonacular.com/recipes/complexSearch?apiKey=a7f2147152a342bfa5c00a841dfe9e49&fillIngredients=true&addRecipeInformation=true&?",parameters: parameters).responseJSON(completionHandler: { response
            in
           // get request
           
            // Jsondecoder
            switch response.result {
                
                
            case .success(_):
//                print(response.description)
                guard let data = response.data else{
                    return
                }
                do{
                    let result = try JSONDecoder().decode(RootClass.self, from: data)
                    print("from network : \(result.results?.first?.analyzedInstructions)")
                    print("from network : \(result.number)")
                    completion(result.results)

    
                }
                catch{
                    
                }
            case .failure(_):
                print("error")
            }
        })
        
        
    }
}
