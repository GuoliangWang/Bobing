//
//  ViewController.swift
//  bobing
//
//  Created by 王国良 on 16/4/12.
//  Copyright © 2016年 happystream. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let conf = WKWebViewConfiguration()
        
        let webview = WKWebView(frame: CGRectMake(0, 0, self.view.bounds.width, self.view.bounds.height), configuration: conf)
  
        webview.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(webview)

        webview.loadFileURL(NSBundle.mainBundle().URLForResource("index", withExtension: "html", subdirectory: "WebProject")!, allowingReadAccessToURL: NSBundle.mainBundle().resourceURL!.URLByAppendingPathComponent("WebProject", isDirectory: true))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

