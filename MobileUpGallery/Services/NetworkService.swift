//
//  NetworkService.swift
//  MobileUpGallery
//
//  Created by Alexander Ognerubov on 19.08.2024.
//

import Foundation

protocol NetworkServiceProtocol: AnyObject {
    func getAccessToken(from currentUrlString: String) async throws -> ExchangeAuthorizationCodeResponseModel
    func createWebViewUrl() -> URL?
}

final class NetworkService: NetworkServiceProtocol {

    private let urlSession: URLSession

    init(urlSession: URLSession = .shared) {
        self.urlSession = urlSession
    }

    func createWebViewUrl() -> URL? {
        var components = URLComponents(string: NetworkConstants.authorize_url.description)
        components?.queryItems = [
            URLQueryItem(name: NetworkConstants.client_id.name, value: NetworkConstants.client_id.description),
            URLQueryItem(name: NetworkConstants.display.name, value: NetworkConstants.display.description),
            URLQueryItem(name: NetworkConstants.redirect_uri.name, value: NetworkConstants.redirect_uri.description),
            URLQueryItem(name: NetworkConstants.scope.name, value: NetworkConstants.scope.description),
            URLQueryItem(name: NetworkConstants.response_type.name, value: NetworkConstants.response_type.description),
            URLQueryItem(name: NetworkConstants.v.name, value: NetworkConstants.v.description)
        ]
        let url = components?.url
        return url
    }

    func getAccessToken(from currentUrlString: String) async throws -> ExchangeAuthorizationCodeResponseModel {
        var responseModel = ExchangeAuthorizationCodeResponseModel(accessToken: "", expiresIn: 0, userId: 0)
        if let url = createExchangeAuthorizationCodeUrl(from: currentUrlString) {
            let request = URLRequest(url: url)
            let (data, _) = try await urlSession.data(for: request)
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            do {
                responseModel = try decoder.decode(ExchangeAuthorizationCodeResponseModel.self, from: data)
            } catch {
                print(error.localizedDescription)
            }
            return responseModel
        }
        return responseModel
    }

    private func createExchangeAuthorizationCodeUrl(from currentUrlString: String) -> URL? {
        var code: String = currentUrlString
        if let range = code.range(of: "code=") {
            let codeRange = code[range.upperBound...].trimmingCharacters(in: .whitespaces)
            code = codeRange
        }
        var components = URLComponents(string: NetworkConstants.access_token.description)
        components?.queryItems = [
            URLQueryItem(name: NetworkConstants.client_id.name, value: NetworkConstants.client_id.description),
            URLQueryItem(name: NetworkConstants.client_secret.name, value: NetworkConstants.client_secret.description),
            URLQueryItem(name: NetworkConstants.redirect_uri.name, value: NetworkConstants.redirect_uri.description),
            URLQueryItem(name: "code", value: code)
        ]
        let url = components?.url
        return url
    }
}
