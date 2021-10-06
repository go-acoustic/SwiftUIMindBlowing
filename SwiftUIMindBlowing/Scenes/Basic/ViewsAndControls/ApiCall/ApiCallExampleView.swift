//
//  ApiCallExampleView.swift
//  SwiftUIMindBlowing
//
//  Created by ohernandezltkmac on 10/5/21.
//  Copyright © 2021 An Tran. All rights reserved.
//

import SwiftUI

struct ApiCallExampleView: View {
    
    var body: some View {
        ExampleView(
            title: "ApiCall",
            demoContentView: ApiCallExampleDemoView(),
            remoteSourcePath: "Basic/ViewsAndControls/ApiCall/ApiCallExampleDemoView.swift"
        )
    }
}

struct ApiCallExampleView_Previews: PreviewProvider {
    static var previews: some View {
        ApiCallExampleView()
    }
}
