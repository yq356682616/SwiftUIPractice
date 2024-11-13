//
//  ErrorAlertBootcamp.swift
//  SUIProduct
//
//  Created by iOS专用 on 2024/10/26.
//

import SwiftUI

protocol AppAlert{
    var title: String{ get }
    var subTitle: String? { get }
    var buttons: AnyView { get }
}
extension View{
    func showCustomAlert<T: AppAlert>(alert: Binding<T?>) -> some View{
        self.alert(alert.wrappedValue?.title ?? "Error", isPresented: Binding(value: alert), actions: {
            alert.wrappedValue?.buttons
        }, message: {
            if let subTitle = alert.wrappedValue?.subTitle{
                Text(subTitle)
            }
            
        })
    }
}
struct ErrorAlertBootcamp: View {
    
    @State private var alert: MyCustomAlertError? = nil
    
    var body: some View {
        Button("CLICK ME") {
            saveData()
        }
        .showCustomAlert(alert: $alert)
    }
    enum MyCustomAlertError: Error, LocalizedError, AppAlert{
        case noInternetConnection(onOKPressed: () -> Void, onRetryPressed: () -> Void)
        case dataNotFound
        case urlError(error: Error)
        
        var errorDescription: String?{
            switch self{
            case .noInternetConnection:
                return "Please check your internet connection an try again."
            case .dataNotFound:
                return "There was an error loading data. Please try again!"
            case .urlError(error: let error):
                return "Error: \(error.localizedDescription)"
            }
        }
        
        var title: String{
            switch self {
            case .noInternetConnection:
                return "No Internet Connection"
            case .dataNotFound:
                return "No data"
            case .urlError:
                return "Error"
            }
        }
        
        var subTitle: String?{
            switch self {
            case .noInternetConnection:
                return "Please check your internet connection an try again."
            case .dataNotFound:
                return nil
            case .urlError(error: let error):
                return "Error: \(error.localizedDescription)"
            }
        }
        var buttons: AnyView{
            AnyView(getButtonsForAlert)
        }
        @ViewBuilder var getButtonsForAlert: some View{
            switch self {
            case .noInternetConnection(onOKPressed: let onOkPressed, onRetryPressed: let onRetryPressed):
                Button("OK") {
                    onOkPressed()
                }
                Button("RETRY") {
                    onRetryPressed()
                }
            case .dataNotFound:
                Button("RETRY") {
                    
                }
            default:
                Button("Delete") {
                    
                }
            }
        }
    }
    private func saveData(){
        let isSuccessful: Bool = false
        if isSuccessful{
            
        }else{
//            let myError: Error = MyCustomAlertError.urlError(error: URLError(.badURL))
//            error = myError
            
            alert = .noInternetConnection(onOKPressed: {
                
            }, onRetryPressed: {
                
            })
        }
    }
}

#Preview {
    ErrorAlertBootcamp()
}
