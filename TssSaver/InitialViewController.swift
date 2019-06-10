//
//  InitialViewController.swift
//  TssSaver
//
//  Created by Ben Mitchell on 04/05/2019.
//  Copyright © 2019 Ben Mitchell. All rights reserved.
//

import UIKit

class InitialViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        // Do any additional setup after loading the view.
    }
    func setup(){
        let launchedBefore = UserDefaults.standard.bool(forKey: "launchedBefore")
        if launchedBefore  {
            print("Not first launch.")
            print("Check ECID")
            checkECID()
        }
        else {
            print("Check ECID")
            UserDefaults.standard.set(true, forKey: "launchedBefore")
            checkECID()
        
        }
    }

    func checkECID(){
        let ecidSet = UserDefaults.standard.bool(forKey: "ecidSet")
        if ecidSet  {
            showSaverView()
        }
        else{
            showECIDEntry()
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
    private func showSaverView() -> Void {
        DispatchQueue.main.async {
            self.performSegue(withIdentifier: "SaverView", sender: self)
        }
    }
    private func showECIDEntry() -> Void {
        DispatchQueue.main.async {
            self.performSegue(withIdentifier: "ECIDEntry", sender: self)
        }
    }
}
