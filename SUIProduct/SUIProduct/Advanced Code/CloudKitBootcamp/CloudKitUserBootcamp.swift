//
//  CloudKitUserBootcamp.swift
//  SUIProduct
//
//  Created by iOS专用 on 2024/10/24.
//

import SwiftUI
import CloudKit
class CloudKitUserBootcampViewModel: ObservableObject{

    @Published var permissionStatus:Bool = false
    @Published var isSignedInToiCould: Bool = false
    @Published var error: String = ""
    @Published var userName: String = ""
    init() {
        getiCloudStatus()
        requestPermission()
        fetchiCloudUserRecordID()
    }
    
    private func getiCloudStatus() {
        CKContainer.default().accountStatus { [weak self](returnStatus, returnedError) in
            DispatchQueue.main.async {
                switch returnStatus{
                case .available:
                    self?.isSignedInToiCould = true
                    break
                case .noAccount:
                    self?.error = CloudKitError.iCloudAccountNotFound.rawValue
                    break
                case .couldNotDetermine:
                    self?.error = CloudKitError.iCloudAccountNotDetermined.rawValue
                    break
                case .restricted:
                    self?.error = CloudKitError.iCloudAccountRestricted.rawValue
                    break
                default:
                    self?.error = CloudKitError.iCloudAccountUnKnown.rawValue
                    break
                }
            }
        }
    }
    
    enum CloudKitError:String, LocalizedError{
        case iCloudAccountNotFound
        case iCloudAccountNotDetermined
        case iCloudAccountRestricted
        case iCloudAccountUnKnown
    }
    func requestPermission(){
        CKContainer.default().requestApplicationPermission([.userDiscoverability]) { retrunedStatus, returnedError in
            DispatchQueue.main.async {
                if retrunedStatus == .granted{
                    self.permissionStatus = true
                }
            }
        }
    }
    func fetchiCloudUserRecordID(){
        CKContainer.default().fetchUserRecordID { returnedID, returnedError in
            if let id = returnedID{
                self.discoveriCloudUser(id: id)
            }
        }
    }
    func discoveriCloudUser(id : CKRecord.ID){
        CKContainer.default().discoverUserIdentity(withUserRecordID: id) { [weak self]returnedIdentify, returnedError in
            DispatchQueue.main.async {
                if let name = returnedIdentify?.nameComponents?.givenName{
                    self?.userName = name
                }
            }
        }
    }
}

struct CloudKitUserBootcamp: View {
    @StateObject private var vm = CloudKitUserBootcampViewModel()
    var body: some View {
        VStack {
            Text("IS SIGNED IN:\(vm.isSignedInToiCould.description.uppercased())")
            Text(vm.error)
            Text("Permission \(vm.permissionStatus.description.uppercased())")
            Text("NAME:\(vm.userName)")
        }
    }
}

#Preview {
    CloudKitUserBootcamp()
}
