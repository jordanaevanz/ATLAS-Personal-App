//
//  Data+.swift
//  personal_project
//
//  Created by Jordan Evans on 9/28/22.
//

import Foundation

extension Data {
    static func fromJSONFile(forTitle Genre: String) -> Data? {
        do {
            if let bundlePath = Bundle.main.path(forResource: Genre, ofType: "json"),
                let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
                return jsonData
            }
        } catch {
            print("Couldnt Read Json", error)
        }
        return nil
    }
}


