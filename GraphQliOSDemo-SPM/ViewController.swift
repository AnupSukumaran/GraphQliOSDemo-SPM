//
//  ViewController.swift
//  GQLiOSDemo
//
//  Created by Manu Puthoor on 14/05/20.
//  Copyright © 2020 Manu Puthoor. All rights reserved.
//

import UIKit
import Apollo



class ViewController: UIViewController {
    
    let apollo: ApolloClient = {
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = [
            "X-Parse-Application-Id": "vdMKjj5T71JQ8NzkXFGJHEztn271yzREkEZAtzNg",
            "X-Parse-Client-Key": "i6dFKE9IFqNlgHdHhPRO9bjFpYvlP1qCnv1UsEyy"
        ]
        let url = URL(string: "https://parseapi.back4app.com/graphql")!
       let ssss = HTTPNetworkTransport(url: url, client: URLSessionClient(sessionConfiguration: configuration))

        
        let ss = ApolloClient(networkTransport: ssss)
//        return ApolloClient(
//            networkTransport: HTTPNetworkTransport(
//                url: url,
//                configuration: configuration
//            )
//        )
        return ss
    }()
    
    
   

    override func viewDidLoad() {
        super.viewDidLoad()
//        apollo.fetch(query: FindAllUsersQuery()) { result in
//            guard let data = try? result.get().data else { return }
//            print(data.objects?.findUser.results[0].username)
//        }
        
        apollo.fetch(query: NewQuery()) { result in
          switch result {
          case .success(let graphQLResult):
            if let name = graphQLResult.data?.users.results[0].username {
              print(name) // Luke Skywalker
            } else if let errors = graphQLResult.errors {
              // GraphQL errors
              print(errors)
            }
          case .failure(let error):
            // Network or response format errors
            print(error)
          }
        }
        
//        apollo.fetch(query: NewQuery()){ result in
//            guard let data = try? result.get().data else { return }
//            print(data.users.results[0].username)
//        }
    }

    
}
