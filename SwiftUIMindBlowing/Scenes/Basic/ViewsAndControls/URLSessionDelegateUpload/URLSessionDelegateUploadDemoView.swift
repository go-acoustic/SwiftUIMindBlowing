//
// Copyright (C) 2022 Acoustic, L.P. All rights reserved.
//
// NOTICE: This file contains material that is confidential and proprietary to
// Acoustic, L.P. and/or other developers. No license is granted under any intellectual or
// industrial property rights of Acoustic, L.P. except as may be provided in an agreement with
// Acoustic, L.P. Any unauthorized copying or distribution of content from this file is
// prohibited.
//
//  URLSessionDelegateDemoView.swift
//  SwiftUIMindBlowing
//
//  Created by ohernandezltkmac on 4/25/22.
//

import SwiftUI

struct URLSessionDelegateUploadDemoView: View {

    @State var randomValue = 0

    var body: some View {
        VStack(alignment: .center) {
            Button(action: {
                let test:URLSessionDelegateTest! = URLSessionDelegateTest(url: "https://ptsv2.com/t/rhpqb-1650593184/post")
                test.uploadData_request_file()
            }) {
                Text("UploadData request_file")
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(lineWidth: 1)
                    )
            }

            Divider()
            
            Button(action: {
                let test:URLSessionDelegateTest! = URLSessionDelegateTest(url: "https://ptsv2.com/t/rhpqb-1650593184/post")
                test.uploadData_request_file_completionHandler()
            }) {
                Text("UploadData request_file_completionHandler")
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(lineWidth: 1)
                    )
            }

            Divider()
            
            Button(action: {
                let test:URLSessionDelegateTest! = URLSessionDelegateTest(url: "https://ptsv2.com/t/rhpqb-1650593184/post")
                test.uploadData_request_data()
            }) {
                Text("UploadData request_data")
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(lineWidth: 1)
                    )
            }

            Divider()
            
            Button(action: {
                let test:URLSessionDelegateTest! = URLSessionDelegateTest(url: "https://ptsv2.com/t/rhpqb-1650593184/post")
                test.uploadData_request_data_completionHandler()
            }) {
                Text("UploadData request_data_completionHandler")
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(lineWidth: 1)
                    )
            }

            Divider()
            
            Button(action: {
                let test:URLSessionDelegateTest! = URLSessionDelegateTest(url: "https://ptsv2.com/t/rhpqb-1650593184/post")
                test.uploadData_withStreamedRequest()
            }) {
                Text("UploadData withStreamedRequest")
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(lineWidth: 1)
                    )
            }

            Divider()
        }
        .navigationBarTitle(Text("URLSessionDelegateUpload"))
        .padding()
    }
}
