//
// Copyright (C) 2022 Acoustic, L.P. All rights reserved.
//
// NOTICE: This file contains material that is confidential and proprietary to
// Acoustic, L.P. and/or other developers. No license is granted under any intellectual or
// industrial property rights of Acoustic, L.P. except as may be provided in an agreement with
// Acoustic, L.P. Any unauthorized copying or distribution of content from this file is
// prohibited.
//
//  URLSessionDelegateDownloadDemoView.swift
//  SwiftUIMindBlowing
//
//  Created by ohernandezltkmac on 4/25/22.
//

import SwiftUI

struct URLSessionDelegateDownloadDemoView: View {

    @State var randomValue = 0

    var body: some View {
        VStack(alignment: .center) {
            Button(action: {
                let test:URLSessionDownloadDelegateTest! = URLSessionDownloadDelegateTest()
                test.startDownload_url(urlString: "http://publications.gbdirect.co.uk/c_book/thecbook.pdf")
            }) {
                Text("DownloadTask with url")
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(lineWidth: 1)
                    )
            }

            Divider()
            
            Button(action: {
                let test:URLSessionDownloadDelegateTest! = URLSessionDownloadDelegateTest()
                test.startDownload_request(urlString: "http://publications.gbdirect.co.uk/c_book/thecbook.pdf")
            }) {
                Text("DownloadTask with request")
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(lineWidth: 1)
                    )
            }

            Divider()
        }
        .navigationBarTitle(Text("URLSessionDelegateDownload"))
        .padding()
    }
}

class URLSessionDownloadDelegateTest: NSObject, URLSessionDownloadDelegate {
    var downloadTask: URLSessionDownloadTask!
    var session : URLSession!
    var receivedData: NSMutableData?
    
    override init() {
        super.init()
        receivedData = NSMutableData()
        self.session = URLSession(configuration: URLSessionConfiguration.default, delegate: self, delegateQueue: OperationQueue.main)
    }
    
    func startDownload_url(urlString:String) {
        let url = URL(string: urlString)!
        downloadTask = self.session.downloadTask(with: url)
        downloadTask.resume()
    }
    
    func startDownload_request(urlString:String) {
        if let url = URL(string: urlString) {
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            downloadTask = self.session.downloadTask(with: request)
            downloadTask.resume()
        }
    }
    
    // Delegate Method1 of URLSessionDownloadDelegate
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL){
        let path = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)
        let documentDirectoryPath:String = path[0]
        let fileManager = FileManager()
        let destinationURLForFile = URL(fileURLWithPath: documentDirectoryPath.appendingFormat("/file.pdf"))
        if fileManager.fileExists(atPath: destinationURLForFile.path){
            print("Found file")
        } else {
            print("Did not find file")
        }
    }
    
    // Delegate Method2 of URLSessionDownloadDelegate
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64){
        let percentDownloaded:Float! = Float(totalBytesWritten)/Float(totalBytesExpectedToWrite)
        print("Progress on download:" + percentDownloaded.description)
    }
    
    //MARK: URLSessionTaskDelegate
    func urlSession(_ session: URLSession, task: URLSessionTask, didCompleteWithError error: Error?){
        downloadTask = nil
        if (error != nil) {
            print(error!.localizedDescription)
            
        }else{
            print("The task finished transferring data successfully")
        }
        print("_ session: URLSession, task: URLSessionTask, didCompleteWithError error: Error?")
    }
}
