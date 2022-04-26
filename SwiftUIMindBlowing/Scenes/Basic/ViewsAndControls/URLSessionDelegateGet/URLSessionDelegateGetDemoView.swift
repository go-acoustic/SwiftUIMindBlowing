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

struct URLSessionDelegateGetDemoView: View {

    @State var randomValue = 0

    var body: some View {
        VStack(alignment: .center) {
            Button(action: {
                let test:URLSessionDelegateTest! = URLSessionDelegateTest(url: "https://api.github.com/users/acoustic-analytics/repos")
                test.getData_dataTask_request_url()
            }) {
                Text("GetData dataTask with request_url")
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(lineWidth: 1)
                    )
            }

            Divider()

            Button(action: {
                let test:URLSessionDelegateTest! = URLSessionDelegateTest(url: "https://api.github.com/users/acoustic-analytics/repos")
                test.getData_dataTask_request_url_completionHandler()
            }) {
                Text("GetData dataTask with request_url_completionHandler")
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(lineWidth: 1)
                    )
            }

            Divider()
            
            Button(action: {
                let test:URLSessionDelegateTest! = URLSessionDelegateTest(url: "https://api.github.com/users/acoustic-analytics/repos")
                test.getData_dataTask_request_urlRequest()
            }) {
                Text("GetData dataTask with request_urlRequest")
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(lineWidth: 1)
                    )
            }

            Divider()
            
            Button(action: {
                let test:URLSessionDelegateTest! = URLSessionDelegateTest(url: "https://api.github.com/users/acoustic-analytics/repos")
                test.getData_dataTask_request_urlRequest_completionHandler()
            }) {
                Text("GetData dataTask with request_urlRequest_completionHandler")
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(lineWidth: 1)
                    )
            }

            Divider()
        }
        .navigationBarTitle(Text("URLSessionDelegateGet"))
        .padding()
    }
}
