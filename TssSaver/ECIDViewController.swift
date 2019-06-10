//
//  ECIDViewController.swift
//  TssSaver
//
//  Created by Ben Mitchell on 04/05/2019.
//  Copyright © 2019 Ben Mitchell. All rights reserved.
//

import UIKit

class ECIDViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var ecidTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func convertToDec(_ sender: Any) {
        let convECID = ecidTextField.text as! String
        let ecid = Int(convECID, radix: 16)!
        UserDefaults.standard.set(ecid, forKey: "ECID")
        showSaverView()
    }
    
    @IBAction func decToECID(_ sender: Any) {
        let ecid = ecidTextField.text
        UserDefaults.standard.set(ecid, forKey: "ECID")
        showSaverView()
    }
    private func showSaverView() -> Void {
        DispatchQueue.main.async {
            self.performSegue(withIdentifier: "SaverView", sender: self)
            UserDefaults.standard.set(true, forKey: "ecidSet")
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
