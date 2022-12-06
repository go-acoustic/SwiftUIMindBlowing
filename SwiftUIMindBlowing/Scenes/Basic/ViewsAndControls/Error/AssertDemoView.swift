//
// Copyright (C) 2022 Acoustic, L.P. All rights reserved.
//
// NOTICE: This file contains material that is confidential and proprietary to
// Acoustic, L.P. and/or other developers. No license is granted under any intellectual or
// industrial property rights of Acoustic, L.P. except as may be provided in an agreement with
// Acoustic, L.P. Any unauthorized copying or distribution of content from this file is
// prohibited.
//
//  AssertDemoView.swift
//  SwiftUIMindBlowing
//
//  Created by Omar Hernandez on 12/5/22.
//

import SwiftUI

struct AssertDemoView: View {

    var body: some View {
        VStack(alignment: .leading) {
            Button(action: {
                assert(5 > 10, "Test Assert")
            }) {
                Text("Test Assert")
            }
        }
        .navigationBarTitle(Text("Test Assert"))
        .padding()
    }
}
