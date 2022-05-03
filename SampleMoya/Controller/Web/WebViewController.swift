//
//  WebViewController.swift
//  SampleMoya
//
//  Created by Makoto on 2022/05/01.
//

import UIKit
import WebKit

final class WebViewController: UIViewController {
    
    @IBOutlet private weak var webView: WKWebView!
    
    private var gitHubModel: GitHubModel?
    
    func configure(gitHubModel: GitHubModel) {
        self.gitHubModel = gitHubModel
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard
            let gitHubModel = gitHubModel,
            let url = URL(string: gitHubModel.urlStr) else { return }
        webView.load(URLRequest(url: url))
    }
}
