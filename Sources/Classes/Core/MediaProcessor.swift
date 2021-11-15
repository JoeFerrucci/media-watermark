//
//  MediaProcessor.swift
//  MediaWatermark
//
//  Created by Sergei on 23/05/2017.
//  Copyright © 2017 rubygarage. All rights reserved.
//

import Foundation
import AVFoundation

let kProcessedTemporaryVideoFileName = "/processed.mp4"

public class MediaProcessor {
    public var filterProcessor: FilterProcessor! = nil

    public let outputFilename: String
    public let outputVideoQuality: String
    
    public init(outputFilename: String? = nil, outputVideoQuality: String = AVAssetExportPresetHighestQuality) {
        if let outputFilename = outputFilename {
            self.outputFilename = "/\(outputFilename).mp4"
        } else {
            self.outputFilename = kProcessedTemporaryVideoFileName
        }
        self.outputVideoQuality = outputVideoQuality
    }
    
    // MARK: - process elements
    public func processElements(item: MediaItem, completion: @escaping ProcessCompletionHandler) {
        item.type == .video ? processVideoWithElements(item: item, completion: completion) : processImageWithElements(item: item, completion: completion)
    }
}
