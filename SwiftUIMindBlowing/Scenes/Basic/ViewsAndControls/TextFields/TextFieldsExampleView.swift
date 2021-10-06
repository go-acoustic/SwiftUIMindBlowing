//
//  TextFieldsExampleView.swift
//  SwiftUIMindBlowing
//
//  Created by ohernandezltkmac on 9/22/21.
//

import SwiftUI

struct TextFieldsExampleView: View {

    var body: some View {
        ExampleView(
            title: "TextFields",
            demoContentView: TextFieldsExampleDemoView(),
            remoteSourcePath: "Basic/ViewsAndControls/TextFields/TextFieldsExampleDemoView.swift"
        )
    }
}

struct TextFieldsExampleView_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldsExampleView()
    }
}
