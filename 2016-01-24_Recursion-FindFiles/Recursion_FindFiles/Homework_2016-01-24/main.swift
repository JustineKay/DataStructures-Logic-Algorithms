//
//  main.swift
//  Homework_2016-01-24
//
//  Created by Justine Gartner on 1/24/16.
//  Copyright © 2016 Justine Kay. All rights reserved.
//

import Foundation

func findFile(name: String, atPath: String) -> String {
    let fileManager = NSFileManager.defaultManager()
    let contents =
    try! fileManager.contentsOfDirectoryAtPath(atPath)
    for fileOrDir in contents {
        var isDir = ObjCBool(false);
        let fullPath = atPath + "/" + fileOrDir
        let exists = fileManager.fileExistsAtPath(fullPath, isDirectory: &isDir)
        if exists && Bool(isDir) {
            
            print("DIR: " + fileOrDir + "Path: " + fullPath)
            
            let found = findFile(name, atPath: fullPath)
            
            if found != "NOT FOUND" {
                
                return found
            }
            
            
        } else if exists {
            
            if fileOrDir == name {
                
                return ("Found file: " + name + " At Path: " + fullPath)
                
            }else {
                
                print("FILE: " + fileOrDir)
                
            }
            
        } else {
            print("NEITHER: " + fileOrDir)
            
        }
    }
    return "NOT FOUND"
}

print(findFile("PriceList.docx", atPath: "/Users/justinegartner/Documents"))
