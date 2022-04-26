//
// Copyright (C) 2022 Acoustic, L.P. All rights reserved.
//
// NOTICE: This file contains material that is confidential and proprietary to
// Acoustic, L.P. and/or other developers. No license is granted under any intellectual or
// industrial property rights of Acoustic, L.P. except as may be provided in an agreement with
// Acoustic, L.P. Any unauthorized copying or distribution of content from this file is
// prohibited.
//
//  URLSessionDelegateTest.swift
//  SwiftUIMindBlowing
//
//  Created by ohernandezltkmac on 4/25/22.
//

import Foundation
import UIKit

class URLSessionDelegateTest: NSObject, URLSessionTaskDelegate, URLSessionDelegate, URLSessionDataDelegate {
    var httpString = "https://api.github.com/users/acoustic-analytics/repos"
    var receivedData: NSMutableData?
    
    init(url:String) {
        super.init()
        httpString   = url
        receivedData = NSMutableData()
    }
    
    func getData_dataTask_request_url() {
        let session = URLSession(configuration: .default, delegate: self, delegateQueue: OperationQueue.main)
        if let url = URL(string: httpString) {
            let task = session.dataTask(with: url)
            task.resume()
        }
    }
    
    func getData_dataTask_request_url_completionHandler() {
        let session = URLSession(configuration: .default, delegate: self, delegateQueue: OperationQueue.main)
        if let url = URL(string: httpString) {
            let task = session.dataTask(with: url, completionHandler: { (data, response, error) in
                print("done:getData_dataTask_request_url_completionHandler")
            })
            task.resume()
        }
    }

    func getData_dataTask_request_urlRequest() {
        let session = URLSession(configuration: .default, delegate: self, delegateQueue: OperationQueue.main)
        if let url = URL(string: httpString) {
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            let task = session.dataTask(with: request)
            task.resume()
        }
    }
    
    func getData_dataTask_request_urlRequest_completionHandler() {
        let session = URLSession(configuration: .default, delegate: self, delegateQueue: OperationQueue.main)
        if let url = URL(string: httpString) {
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            let task = session.dataTask(with: request, completionHandler: { (data, response, error) in
                print("done:getData_dataTask_request_urlRequest_completionHandler")
            })
            task.resume()
        }
    }
    
    func uploadData_request_file() {
        let session = URLSession(configuration: .default, delegate: self, delegateQueue: OperationQueue.main)
        if let url = URL(string: httpString) {
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.setValue("Keep-Alive", forHTTPHeaderField: "Connection")
            let fileurl = URL(string: "http://www.apple.com/euro/ios/ios8/a/generic/images/og.png")!
            let task = session.uploadTask(with: request, fromFile: fileurl)
            task.resume()
        }
    }
    
    func uploadData_request_file_completionHandler() {
        let session = URLSession(configuration: .default, delegate: self, delegateQueue: OperationQueue.main)
        if let url = URL(string: httpString) {
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.setValue("Keep-Alive", forHTTPHeaderField: "Connection")
            let fileurl = URL(string: "http://www.apple.com/euro/ios/ios8/a/generic/images/og.png")!
            let task = session.uploadTask(with: request, fromFile: fileurl, completionHandler: { (data, response, error) in
                print("done:uploadData_request_file_completionHandler")
            })
            task.resume()
        }
    }
    
    func uploadData_request_data() {
        let session = URLSession(configuration: .default, delegate: self, delegateQueue: OperationQueue.main)
        if let url = URL(string: httpString) {
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.setValue("Keep-Alive", forHTTPHeaderField: "Connection")
            let image: UIImage? = UIImage.init(imageLiteralResourceName: "ios-beer")
            let task = session.uploadTask(with: request, from: (image?.pngData())!)
            task.resume()
        }
    }
    
    func uploadData_request_data_completionHandler() {
        let session = URLSession(configuration: .default, delegate: self, delegateQueue: OperationQueue.main)
        if let url = URL(string: httpString) {
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.setValue("Keep-Alive", forHTTPHeaderField: "Connection")
            let image: UIImage? = UIImage.init(imageLiteralResourceName: "ios-beer")
            let task = session.uploadTask(with: request, from: image?.pngData(), completionHandler: { (data, response, error) in
                print("done:uploadData_request_data_completionHandler")
            })
            task.resume()
        }
    }
    
    func uploadData_withStreamedRequest() {
        let session = URLSession(configuration: .default, delegate: self, delegateQueue: OperationQueue.main)
        if let url = URL(string: httpString) {
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.setValue("Keep-Alive", forHTTPHeaderField: "Connection")
            let task = session.uploadTask(withStreamedRequest: request)
            task.resume()
        }
    }
    
    func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive response: URLResponse,
                    completionHandler: @escaping (URLSession.ResponseDisposition) -> Void) {
        guard let response = response as? HTTPURLResponse,
            (200...299).contains(response.statusCode),
            let mimeType = response.mimeType,
            mimeType == "application/json" else {
            completionHandler(.cancel)
            return
        }
        completionHandler(.allow)
    }

    func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive data: Data) {
        print("Data received")
        print(dataTask.description)
        self.receivedData?.append(data)
    }

    func urlSession(_ session: URLSession, task: URLSessionTask, didCompleteWithError error: Error?) {
        DispatchQueue.main.async {
            if let error = error {
                print(error)
            } else if let receivedData = self.receivedData,
                      let string = String(data: receivedData as Data, encoding: .utf8) {
                print(string)
                print(task.currentRequest?.url as Any)
            }
            print("done:_ session: URLSession, task: URLSessionTask, didCompleteWithError error: Error?")
        }
    }
}
