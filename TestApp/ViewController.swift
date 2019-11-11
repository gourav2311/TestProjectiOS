//
//  ViewController.swift
//  TestApp
//
//  Created by gourav jaiswal on 26/12/18.
//  Copyright © 2018 gourav jaiswal. All rights reserved.
//

import UIKit
import SwiftyJSON
import SDWebImage
import NVActivityIndicatorView

class ViewController: UIViewController,NVActivityIndicatorViewable {

    @IBOutlet weak var articlesTableView: UITableView!

    
    var articles = [Article]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.apiexecute()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func apiexecute() {
          self.startAnimating()
        if(Utilities.startNetworkReachabilityObserver()){
            print("gourav")
            
                let api = Api()
                api.apiCall(section: "article"){
                    responseObject, error in
                    if responseObject != nil{
                        let json = JSON(responseObject!)
                        if(json["status"] == "ok"){
                            
                            if let detailsarray = json["articles"].array {
                                for item in detailsarray {
                                    let anItem = Article(fromJSON: item)
                                    self.articles.append(anItem)
                                }
                            }
                        
            
                            self.articlesTableView.reloadData()
                            
                            
                        //    print(detailsarray!)
                            
                            
                            
                            self.stopAnimating()
                        
                        }else{
                           self.showError(title:"Invalid Deatils", message: "Please Try Again")
                           
                            self.stopAnimating()
                            //self.showError(title:"Invalid Login Details", message: "Please Try Again")
                        }
                    }
                    else{
                       
                        
                        if let err = error {
                        
                        }
                        print(error!)
                        self.stopAnimating()
                        self.showError(title:"Invalid Deatils", message: "Please Try Again")
                        
                    }
                }
                
            
           
        }else{
            self.stopAnimating()
            
            self.showError(title: " No Internet Connection", message: "You must connect to the internet to use the Test App")
            //self.toggleIndicator()
        }
        
    }
    
    func showError(title: String, message: String){
       
            let alert = Utilities.customErrorAlertView(errorTitle: "\(title)", errorMessage:  "\(message)", errorButtonTitle: "Ok")
            self.present(alert, animated: true, completion: nil)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    fileprivate func openWebVC(withStringURL stringUrl: String) {
    
    if let vc = self.storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController {
        vc.urlString = stringUrl
        self.present(vc, animated: true, completion: nil)
    }
}


}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ArticleTableViewCell.identifier, for: indexPath) as! ArticleTableViewCell
        
        let cellItem = articles[indexPath.row]
        cell.imageV.sd_setImage(with: URL(string: cellItem.urlToImage), completed: nil)
        cell.title.text = cellItem.title
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let item = articles[indexPath.row]
        openWebVC(withStringURL: item.imageURL)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
}

