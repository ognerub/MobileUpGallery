//
//  WebCoordinator.swift
//  MobileUpGallery
//
//  Created by Alexander Ognerubov on 19.08.2024.
//

import Foundation
import WebKit

final class WebViewCoordinator: NSObject, WKNavigationDelegate {

    var parent: WebView

    init(_ parent: WebView) {
        self.parent = parent
    }

    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        print(error.localizedDescription)
    }

    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        if let url = webView.url?.absoluteString {
            parent.delegate?.sendWebViewStatus(isLoading: true)
        }
    }

    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        if let _ = webView.url?.absoluteString {
            parent.delegate?.sendWebViewStatus(isLoading: false)
        }
    }

    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        let redirect_uri = NetworkConstants.redirect_uri.description
        if let urlStr = navigationAction.request.url?.host {
            if redirect_uri.contains(urlStr) {
                decisionHandler(.cancel)
                parent.delegate?.sendWebViewVisibility(isVisible: false)
                parent.delegate?.sendCurrentURL(string: navigationAction.request.url?.absoluteString ?? "")
            } else {
                decisionHandler(.allow)
            }
        }
    }
}
