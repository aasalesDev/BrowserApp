//
//  ViewController.swift
//  BrowserApp
//
//  Created by Anderson Sales on 26/10/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var companyTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func accessButtonTapped(_ sender: UIButton) {
        if let vc = UIStoryboard(name: "Display", bundle: nil).instantiateViewController(withIdentifier: "display") as? DisplayViewController {
            if companyTextField.text == "" {
                vc.company = "linkedin"
            } else{
                vc.company = companyTextField.text ?? ""
            }
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}
