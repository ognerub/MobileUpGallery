//
//  VideoService.swift
//  MobileUpGallery
//
//  Created by Alexander Ognerubov on 20.08.2024.
//

import Foundation

protocol VideoServiceProtocol: AnyObject {
    func getVideosFrom(_ fileName: String) -> VideoResponseModel?
}

final class VideoService: VideoServiceProtocol {

    func getVideosFrom(_ fileName: String) -> VideoResponseModel? {
        guard let fileURL = Bundle.main.url(forResource: fileName, withExtension: "json") else {
            return nil
        }
        do {
            let data = try Data(contentsOf: fileURL)
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let jsonData = try decoder.decode(VideoResponseModel.self, from: data)
            return jsonData
        } catch {
            print("error:\(error)")
        }
        return nil
    }
}
