//
//  LocalFileManager.swift
//  Stat_Tracker_2022
//
//  Created by Michael Potts on 1/24/22.
//

import Foundation
import UIKit

class LocalFileManager {
    
    static let instance = LocalFileManager()
    
    let folderName = "PlayerStats"
    
    init() {
        createFolderIfNeeded()
    }
    
    func createFolderIfNeeded() {
        guard
            let path = FileManager
                .default
                .urls(for: .cachesDirectory, in: .userDomainMask)
                .first?
                .appendingPathComponent(folderName)
                .path else {
                    return
                }
        
        if !FileManager.default.fileExists(atPath: path) {
            do {
                try FileManager.default.createDirectory(atPath: path, withIntermediateDirectories: true, attributes: nil)
                print("Success creating folder.")
            } catch let error {
                print("Error creating the folder. \(error)")
            }
        }
    }
    
    func saveImage(image: UIImage, name: String) {
        guard
            let data = image.jpegData(compressionQuality: 0.5),
            let path = getPathForImage(name: name) else {
                print("Error getting data.")
                return
            }
        do {
            try data.write(to: path)
            print(path)
            print("Success saving!")
            return
        } catch let error {
            print("Error saving. \(error)")
            return
        }
    }
    
    func getImage(name: String) -> UIImage? {
        guard
            let path = getPathForImage(name: name)?.path,
            FileManager.default.fileExists(atPath: path) else {
                print("Error getting path.")
                return nil
            }
        return UIImage(contentsOfFile: path)
    }
    
    func deleteImage(name: String) {
        guard
            let path = getPathForImage(name: name),
            FileManager.default.fileExists(atPath: path.path) else {
                print("Error getting path.")
                return
            }
        
        do {
            try FileManager.default.removeItem(at: path)
            return
        } catch let error {
            print("Error deleting image. \(error)")
            return
        }
    }
    
    func getPathForImage(name: String) -> URL? {
        guard
            let path = FileManager
                .default
                .urls(for: .cachesDirectory, in: .userDomainMask)
                .first?
                .appendingPathComponent(folderName)
                .appendingPathComponent("\(name).jpeg") else {
                    print("Error getting path.")
                    return nil
                }
        return path
    }
}
