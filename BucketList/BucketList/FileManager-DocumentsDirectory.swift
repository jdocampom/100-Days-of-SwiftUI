//
//  FileManager-DocumentsDirectory.swift
//  BucketList
//
//  Created by Juan Diego Ocampo on 31/12/21.
//

import Foundation

extension FileManager {
    static var documentsDirectory: URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}

