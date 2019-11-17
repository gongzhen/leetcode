//
//  ConvertSnakeCase.swift
//  AirbnbSwift
//
//  Created by Zhen Gong on 10/22/19.
//  Copyright © 2019 Zhen Gong. All rights reserved.
//

import Foundation

public func convertFromSnakeCase(_ stringKey: String) -> String {
    return _convertFromSnakeCase(stringKey)
}

fileprivate func _convertFromSnakeCase(_ stringKey: String) -> String {
     guard !stringKey.isEmpty else { return stringKey }
 
     // Find the first non-underscore character
     guard let firstNonUnderscore = stringKey.firstIndex(where: { $0 != "_" }) else {
         // Reached the end without finding an _
         return stringKey
     }
 
     // Find the last non-underscore character
     var lastNonUnderscore = stringKey.index(before: stringKey.endIndex)
     print(stringKey[lastNonUnderscore])
     while lastNonUnderscore > firstNonUnderscore && stringKey[lastNonUnderscore] == "_" {
        stringKey.formIndex(before: &lastNonUnderscore)
        print(lastNonUnderscore)
     }
 
     let keyRange = firstNonUnderscore...lastNonUnderscore
     let leadingUnderscoreRange = stringKey.startIndex..<firstNonUnderscore
     let trailingUnderscoreRange = stringKey.index(after: lastNonUnderscore)..<stringKey.endIndex
 
     let components = stringKey[keyRange].split(separator: "_")
     let joinedString : String
     if components.count == 1 {
         // No underscores in key, leave the word as is - maybe already camel cased
         joinedString = String(stringKey[keyRange])
     } else {
         joinedString = ([components[0].lowercased()] + components[1...].map { $0.capitalized }).joined()
     }
 
     // Do a cheap isEmpty check before creating and appending potentially empty strings
     let result : String
     if (leadingUnderscoreRange.isEmpty && trailingUnderscoreRange.isEmpty) {
         result = joinedString
     } else if (!leadingUnderscoreRange.isEmpty && !trailingUnderscoreRange.isEmpty) {
         // Both leading and trailing underscores
         result = String(stringKey[leadingUnderscoreRange]) + joinedString + String(stringKey[trailingUnderscoreRange])
     } else if (!leadingUnderscoreRange.isEmpty) {
         // Just leading
         result = String(stringKey[leadingUnderscoreRange]) + joinedString
     } else {
         // Just trailing
         result = joinedString + String(stringKey[trailingUnderscoreRange])
     }
    print(result)
     return result
 }
