//
//  ViewController.swift
//  SwiftyHooView
//
//  Copyright © 2016 Yahoo. All rights reserved.
//

import UIKit
import SSZipArchive

class ViewController: UIViewController {
    
    struct Constants {
        static let AGBookProLightFontName = "AGBookPro-LightCnd"
        static let AGBookProMediumFontName = "AGBookPro-MediumCnd"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let hooSets = try? ViewController.unzipHooSets()
        print("\(hooSets?.description ?? "")")
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    static func unzipHooSets() throws -> [URL] {
        let fileManager = FileManager.default
        let uniqueString = ProcessInfo.processInfo.globallyUniqueString
        let destinationDirectoryURL = URL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent(uniqueString, isDirectory: true)
        try fileManager.createDirectory(at: destinationDirectoryURL, withIntermediateDirectories: true, attributes: nil)
        
        return Bundle.main.paths(forResourcesOfType: "zip", inDirectory: "HooSets").flatMap {
            SSZipArchive.unzipFile(atPath: $0, toDestination: destinationDirectoryURL.path)
            
            let hooSetDirectoryName = URL(fileURLWithPath: $0).deletingPathExtension().lastPathComponent
            let hooSetDirectoryURL = destinationDirectoryURL.appendingPathComponent(hooSetDirectoryName, isDirectory: true)
            let hooSetDirectoryPath = hooSetDirectoryURL.path
            guard fileManager.fileExists(atPath: hooSetDirectoryPath) else {
                return nil
            }
            
            return hooSetDirectoryURL
        }
    }
}

