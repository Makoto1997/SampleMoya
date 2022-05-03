//
//  GitHubAPI.swift
//  SampleMoya
//
//  Created by Makoto on 2022/05/01.
//

import Foundation
import Moya

enum GitHubAPI {
    case user
}

extension GitHubAPI: TargetType {
    
    var baseURL: URL {
        guard let url = URL(string: "https://api.github.com/search/repositories?q=swift&sort=stars") else { fatalError() }
        return url
    }
    
    var path: String {
        switch self {
        case .user:
            return ""
        }
    }
    
    var method: Moya.Method {
        return Moya.Method.get
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        return .requestPlain
    }
    
    var headers: [String : String]? {
        return nil
    }
    
    func get(completion: ((Result<[GitHubModel], Error>) -> Void)? = nil) {
        
        let provider = MoyaProvider<GitHubAPI>()
        provider.request(.user) { result in
            switch result {
            case .success(let res):
                let data = res.data
                guard
                    let decodeData = try? JSONDecoder().decode(APIResponse.self, from: data),
                    let models = decodeData.items else { return }
                completion?(.success(models))
            case .failure(let err):
                completion?(.failure(err))
            }
        }
    }
}
