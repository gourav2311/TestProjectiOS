//
//  DetailViewController.swift
//  TestApp
//
//  Created by Gourav on 28/12/18.
//  Copyright © 2018 gourav jaiswal. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var closeButton: UIButton!

    
    var urlString = String()

    override func viewDidLoad() {
        super.viewDidLoad()
        openURL(withStringURL: urlString)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    fileprivate func openURL(withStringURL urlString: String) {
        let url = URL (string: urlString)
        let requestURL = URLRequest(url: url!)
        webView.loadRequest(requestURL)
    }
    
    @IBAction func closeScreen(_ sender: UIButton) {
      self.dismiss(animated: true, completion: nil)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
