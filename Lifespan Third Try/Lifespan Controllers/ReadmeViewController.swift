//
//  ReadmeViewController.swift
//  Lifespan Third Try
//
//  Created by jpavley12 on 3/25/18.
//  Copyright © 2018 jpavley12. All rights reserved.
//

import UIKit
import WebKit

class ReadmeViewController: UIViewController, WKNavigationDelegate {

    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        webView.navigationDelegate = self
        WebUtilities.loadHTMLFile(named: "Readme", webView: webView)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: - Navigation
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

}
