//
//  Overrides.swift
//  TssSaver
//
//  Created by Ben Mitchell on 04/05/2019.
//  Copyright © 2019 Ben Mitchell. All rights reserved.
//

import UIKit

extension UIViewController {
    @IBAction func unwind(_ segue: UIStoryboardSegue) {}
    @IBAction func done(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
    override open func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
