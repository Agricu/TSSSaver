//
//  BlobSaver.swift
//  TssSaver
//
//  Created by Ben Mitchell on 04/05/2019.
//  Copyright © 2019 Ben Mitchell. All rights reserved.
//

import Foundation

class BlobSaver {

    func save(for ecid: String, board: String, model: String, handler: @escaping (Blob?, SaverError?) -> Void) {
    
        API.shared.makeRequest(to: "app.php", method: .POST([
            "ecid": ecid,
            "boardConfig": board,
            "deviceID": model
        ], .formURLEncoded)) { response, error in
            guard let response = response else { handler(nil, SaverError(message: "服务器未响应")); return }
            if let dict = API.shared.decode(jsonData: response) {
                if error != nil || dict["success"] as? Bool == false {
                    if let errorDict = dict["error"] as? [String: AnyObject] {
                        handler(nil, SaverError(from: errorDict))
                    } else {
                        handler(nil, SaverError(message: "未知错误", code: 999))
                    }
                }
                if let url = dict["url"] as? String {
                    handler(Blob(url: url), nil)
                }
            }
        }
    }
    
}
