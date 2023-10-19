//
//  ApiServices.swift
//  iosTrainingDayTwo
//
//  Created by P090MMCTSE012 on 19/10/23.
//

import Foundation
import Alamofire

class ApiServices: NSObject {
    func fetchEmployees(
        onSuccess: @escaping ([EmployeeValue]) -> Void,
        onError: @escaping (Error?) -> Void
    ){
        guard let url = URL(string: "https://dummy.restapiexample.com/api/v1/employees") else { return }
        let urlConvertible: URLConvertible = url;
        
        AF.request(urlConvertible, method: .get).response{response in
            do{
                let result = try JSONDecoder().decode(EmployeeData.self, from: response.data!)
                DispatchQueue.main.async{ 
                    onSuccess(result.data)
                }
            }catch let jsonErr{
                onError(jsonErr)
            }
        }
    }
}
