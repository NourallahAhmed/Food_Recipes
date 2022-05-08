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
        let myUrl = URL(string: "https://api.spoonacular.com/recipes/complexSearch?apiKey=dbf6bff012ad44bfad9b5b5582c6f963&fillIngredients=true&addRecipeInformation=true&?&query=")
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
    
    func getAlamoFire( completion: @escaping ([Results]?) -> Void){
   
        // 1 request
        AF.request("https://api.spoonacular.com/recipes/complexSearch?apiKey=dbf6bff012ad44bfad9b5b5582c6f963&fillIngredients=true&addRecipeInformation=true&?&query=").responseJSON(completionHandler: { response
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
                    print(result.results?.first)
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
