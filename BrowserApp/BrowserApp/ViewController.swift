//
//  ViewController.swift
//  BrowserApp
//
//  Created by Anderson Sales on 26/10/22.
//

import UIKit

class ViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func accessButtonTapped(_ sender: UIButton) {
        if let vc = UIStoryboard(name: "DisplayViewController", bundle: nil).instantiateViewController(withIdentifier: "detail") as? DisplayViewController {
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}
