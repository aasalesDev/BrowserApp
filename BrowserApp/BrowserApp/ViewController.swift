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
        if let vc = UIStoryboard(name: "Display", bundle: nil).instantiateViewController(withIdentifier: "display") as? DisplayViewController {
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}
