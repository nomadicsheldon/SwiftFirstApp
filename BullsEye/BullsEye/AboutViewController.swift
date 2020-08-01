//
//  AboutViewController.swift
//  BullsEye
//
//  Created by Himanshu Rajput on 31/07/20.
//  Copyright © 2020 Himanshu Rajput. All rights reserved.
//

import UIKit
import WebKit

class AboutViewController: UIViewController {
    @IBOutlet weak var webView: WKWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        if let htmlPath = Bundle.main.path(forResource: "BullsEye", ofType: "html", inDirectory: nil) {
            let url = URL(fileURLWithPath: htmlPath)
            let request = URLRequest(url: url)
            webView.load(request)
        }
        // Do any additional setup after loading the view.
    }

    @IBAction func close() {
        dismiss(animated: true, completion: nil)
    }
}
