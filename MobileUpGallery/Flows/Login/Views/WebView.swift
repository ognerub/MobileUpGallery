//
//  WebView.swift
//  MobileUpGallery
//
//  Created by Alexander Ognerubov on 18.08.2024.
//

import SwiftUI
import WebKit

protocol WebViewProtocol: AnyObject {
    func sendCurrentURL(string: String)
    func sendWebViewStatus(isLoading: Bool)
    func sendWebViewVisibility(isVisible: Bool)
}

struct WebView: UIViewRepresentable {

    var delegate: WebViewProtocol?
    var webView: WKWebView = {
        let configuration = WKWebViewConfiguration()
        var webView = WKWebView(frame: .zero, configuration: configuration)
        return webView
    }()
    private var url: URL?

    init(url: URL?) {
        self.url = url
    }

    func makeCoordinator() -> WebViewCoordinator {
        return WebViewCoordinator(self)
    }

    func makeUIView(context: Context) -> WKWebView {
        webView.navigationDelegate = context.coordinator
        return webView
    }

    func updateUIView(_ webView: WKWebView, context: Context) {
        guard let url = url else { return }
        let request = URLRequest(url: url)
        webView.load(request)
    }

    func loadURL(urlString: String) {
        guard let url = URL(string: urlString) else { return }
        let request = URLRequest(url: url)
        webView.load(request)
    }
}
