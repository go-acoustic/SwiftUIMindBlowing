//
// Copyright (C) 2022 Acoustic, L.P. All rights reserved.
//
// NOTICE: This file contains material that is confidential and proprietary to
// Acoustic, L.P. and/or other developers. No license is granted under any intellectual or
// industrial property rights of Acoustic, L.P. except as may be provided in an agreement with
// Acoustic, L.P. Any unauthorized copying or distribution of content from this file is
// prohibited.
//
//  PreconditionFailureDemoView.swift
//  SwiftUIMindBlowing
//
//  Created by Omar Hernandez on 12/5/22.
//

import SwiftUI

struct PreconditionFailureDemoView: View {

    var body: some View {
        VStack(alignment: .leading) {
            Button(action: {
                preconditionFailure("Test PreconditionFailure")
            }) {
                Text("Test PreconditionFailure")
            }
        }
        .navigationBarTitle(Text("Test PreconditionFailure"))
        .padding()
    }
}


