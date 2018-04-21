//
//  File.swift
//  Lifespan 2018
//
//  Created by jpavley12 on 3/24/18.
//  Copyright © 2018 jpavley12. All rights reserved.
//

import Foundation
import WebKit

class WebUtilities {
    
    static func loadHTMLFile(named name: String, webView: WKWebView) {
        do {
            guard
                let filePath = Bundle.main.path(forResource: name, ofType: "html")
                else {
                    print("read error file\(name)")
                    return
            }
            let contents = try String(contentsOfFile: filePath, encoding: .utf8)
            let url = URL(fileURLWithPath: filePath)
            webView.loadHTMLString(contents as String, baseURL: url)
        } catch {
            print("load error file \(name)")
        }
    }
    
    static func loadHTMLString(html: String, webView: WKWebView) {
        webView.loadHTMLString(html, baseURL: nil)
    }

}
