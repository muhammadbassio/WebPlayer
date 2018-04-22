//
//  Example
//
//  Copyright © 2018 Muhammad Bassio. All rights reserved.
//

import UIKit
import WebKit

open class WebPlayerView: UIView {
  
  private var webView = WKWebView()
  
  public override init(frame: CGRect) {
    super.init(frame: frame)
    self.initUI()
  }
  
  required public init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    self.initUI()
  }
  
  private func initUI() {
    let jScript = "var meta = document.createElement('meta'); meta.setAttribute('name', 'viewport'); meta.setAttribute('content', 'width=device-width'); document.getElementsByTagName('head')[0].appendChild(meta);"
    let wkUScript = WKUserScript(source: jScript, injectionTime: .atDocumentEnd, forMainFrameOnly: true)
    let wkUController = WKUserContentController()
    wkUController.addUserScript(wkUScript)
    let configuration = WKWebViewConfiguration()
    configuration.userContentController = wkUController
    configuration.allowsInlineMediaPlayback = true
    configuration.allowsAirPlayForMediaPlayback = true
    configuration.allowsPictureInPictureMediaPlayback = true
    if #available(iOS 10.0, *) {
      configuration.mediaTypesRequiringUserActionForPlayback = []
    } else {
      configuration.requiresUserActionForMediaPlayback = false
    }
    self.webView = WKWebView(frame: self.bounds, configuration: configuration)
    self.webView.scrollView.isScrollEnabled = false
    self.webView.scrollView.bounces = false
    self.webView.backgroundColor = UIColor.black
    self.webView.isOpaque = true
    self.webView.navigationDelegate = self
    self.webView.translatesAutoresizingMaskIntoConstraints = false
    
    self.addSubview(self.webView)
    
    self.webView.isUserInteractionEnabled = true
    
  }
  
  override open func layoutSubviews() {
    self.webView.frame = self.bounds
  }
  
  open func load(url:String) {
    self.webView.load(URLRequest(url: URL(string: url)!))
  }
  
  open func load(html:String) {
    self.webView.loadHTMLString(html, baseURL: nil)
  }
  
}

extension WebPlayerView: WKNavigationDelegate {
  
  public func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
    print("finished: \(navigation)")
    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
      self.webView.evaluateJavaScript("document.getElementById('play-overlay').style.display = \"none\";", completionHandler: nil)
    }
  }
  
  public func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
    print("failed")
  }
  
  public func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
    decisionHandler(WKNavigationActionPolicy.allow)
  }
}

