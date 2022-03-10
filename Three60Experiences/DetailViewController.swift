//
//  DetailViewController.swift
//  Three60Experiences
//
//  Created by Tri Do on 19/02/2022.
//

import UIKit
import WebKit
import FittedSheets

class DetailViewController: UIViewController {
    
    @IBOutlet weak var webView: WKWebView?
    var link: String = ""
    let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)

    override func viewDidLoad() {
        super.viewDidLoad()
        webView?.configuration.mediaTypesRequiringUserActionForPlayback = .all
        webView?.configuration.allowsInlineMediaPlayback = false
        webView?.load(URLRequest(url: URL(string: link)!))
        webView?.pauseAllMediaPlayback(completionHandler: nil)
        
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "comment"), for: .normal)
        button.configuration?.contentInsets = NSDirectionalEdgeInsets(top: 4, leading: 4, bottom: 4, trailing: 4)
        button.addTarget(self, action: #selector(self.openRateCommentVC), for: .touchUpInside)
        let rightBarButtonItem = UIBarButtonItem(customView: button)
        self.navigationItem.rightBarButtonItem = rightBarButtonItem
    }
    
    @objc func openRateCommentVC() {
        showRateCommetVC()
    }
    
    func showRateCommetVC() {
        if let destinationViewController = storyboard?.instantiateViewController(withIdentifier: "RateComment") {
            var options = SheetOptions()
            options.pullBarHeight = 40
            options.useFullScreenMode = false
            options.shrinkPresentingViewController = false

            let sheetController = SheetViewController(
                controller: destinationViewController,
                sizes: [.fixed(430)],
                options: options)
            sheetController.overlayColor = .clear
            sheetController.treatPullBarAsClear = true
            sheetController.cornerRadius = 30
            sheetController.gripSize = CGSize(width: 100, height: 8)
            present(sheetController, animated: true, completion: nil)
        }
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
