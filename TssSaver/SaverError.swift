//
//  SaverError.swift
//  TssSaver
//
//  Created by Ben Mitchell on 04/05/2019.
//  Copyright © 2019 Ben Mitchell. All rights reserved.
//

import Foundation
import UIKit

struct SaverError: CustomStringConvertible {
    let message: String?, code: Int?
    
    init(message: String? = nil, code: Int? = nil) {
        self.message = message
        self.code = code
    }
    
    init(from errorDictionary: [String: AnyObject]) {
        self.init(message: errorDictionary["message"] as? String, code: errorDictionary["code"] as? Int)
    }
    
    var errorMessage: String {
        return message ?? "错误"
    }
    
    var description: String {
        return "服务器错误:请更换网络或者科学上网后重试！！"
    }
    
    var alertController: UIAlertController {
        let alert = UIAlertController(title: "错误", message: "\(self.description)", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "关闭", style: .cancel, handler: nil))
        return alert
    }
}
