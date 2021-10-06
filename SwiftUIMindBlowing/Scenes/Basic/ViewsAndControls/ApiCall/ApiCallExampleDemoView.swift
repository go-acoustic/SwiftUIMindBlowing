//
//  ApiCallExampleDemoView.swift
//  SwiftUIMindBlowing
//
//  Created by ohernandezltkmac on 10/5/21.
//  Copyright © 2021 An Tran. All rights reserved.
//

import SwiftUI
import Foundation

struct Comments: Codable, Identifiable {
    let id = UUID()
    let name: String
    let email: String
    let body: String
}

class apiCall {
    func getUserComments(completion:@escaping ([Comments]) -> ()) {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts/1/comments") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            let comments = try! JSONDecoder().decode([Comments].self, from: data!)
            print(comments)
            
            DispatchQueue.main.async {
                completion(comments)
            }
        }
        .resume()
    }
}

struct ApiCallExampleDemoView: View {
    //1.
    @State var comments = [Comments]()
    
    var body: some View {
        NavigationView {
            //3.
            List(comments) { comment in
                VStack(alignment: .leading) {
                    Text(comment.name)
                        .font(.title)
                        .fontWeight(.bold)
                    Text(comment.email)
                        .font(.subheadline)
                        .fontWeight(.bold)
                    Text(comment.body)
                        .font(.body)
                }
                
            }
            //2.
            .onAppear() {
                apiCall().getUserComments { (comments) in
                    self.comments = comments
                }
            }.navigationTitle("Comments")
        }
    }
}
