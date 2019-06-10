//
//  Blob.swift
//  TssSaver
//
//  Created by Ben Mitchell on 04/05/2019.
//  Copyright © 2019 Ben Mitchell. All rights reserved.
//

import Foundation

struct Blob {
    let url: String
    
    var blobURL: URL {
        return URL(string: self.url)!
    }
}
