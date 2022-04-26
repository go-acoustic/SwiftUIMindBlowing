//
// Copyright (C) 2022 Acoustic, L.P. All rights reserved.
//
// NOTICE: This file contains material that is confidential and proprietary to
// Acoustic, L.P. and/or other developers. No license is granted under any intellectual or
// industrial property rights of Acoustic, L.P. except as may be provided in an agreement with
// Acoustic, L.P. Any unauthorized copying or distribution of content from this file is
// prohibited.
//
//  URLSessionDelegateRedirectDemoView.swift
//  SwiftUIMindBlowing
//
//  Created by ohernandezltkmac on 4/25/22.
//

import SwiftUI

struct URLSessionDelegateRedirectDemoView: View {

    @State var randomValue = 0

    var body: some View {
        VStack(alignment: .center) {
            Button(action: {
                let test:URLSessionDelegateTest_Redirect! = URLSessionDelegateTest_Redirect()
                test.startDownloadWithDelegateHandler(urlString: "http://bitly.com/filmenczer")
            }) {
                Text("DataTask(with: request)")
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(lineWidth: 1)
                    )
            }

            Divider()
        }
        .navigationBarTitle(Text("URLSessionDelegateRedirect"))
        .padding()
    }
}

class URLSessionDelegateTest_Redirect : NSObject, URLSessionDelegate, URLSessionDataDelegate {
    var session : URLSession!
    var tasks : [URLSessionDataTask : String] = [URLSessionDataTask : String]()
    var receivedData: NSMutableData?
    
    override init() {
        super.init()
        receivedData = NSMutableData()
    }

    func startDownloadWithDelegateHandler(urlString:String) {
        self.session = URLSession(configuration: URLSessionConfiguration.default, delegate: self, delegateQueue: OperationQueue.main)

        guard let url = URL(string: urlString) else { return }
        let request : URLRequest = URLRequest(url: url)

        let dataTask : URLSessionDataTask = session.dataTask(with: request)
        self.tasks[dataTask] = urlString

        dataTask.resume()
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
            print("_ session: URLSession, task: URLSessionTask, didCompleteWithError error: Error?")
        }
    }

    func urlSession(_ session: URLSession, task: URLSessionTask, willPerformHTTPRedirection response: HTTPURLResponse, newRequest request: URLRequest, completionHandler: @escaping (URLRequest?) -> Void) {
        print("Getting redirected")
        print(response)

        let newDataTask = self.session.dataTask(with: request)
        self.tasks[newDataTask] = String(describing: request.url)
        print(newDataTask.taskDescription as Any)
        newDataTask.resume()
    }

    func urlSession(_ session: URLSession, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
        completionHandler(URLSession.AuthChallengeDisposition.performDefaultHandling, nil)
    }

    func urlSession(_ session: URLSession, task: URLSessionTask, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
        completionHandler(URLSession.AuthChallengeDisposition.performDefaultHandling, nil)
    }

    func urlSession(_ session: URLSession, didBecomeInvalidWithError error: Error?) {
        if let _ = error {
            print(error!)
        }
    }
}
