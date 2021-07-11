//
//  AppListView.swift
//  PersonalStore
//
//  Created by Evan Anger on 7/10/21.
//

import SwiftUI
import Combine

struct AppListView: View {
    let persistenceController = PersistenceController.shared
    @ObservedObject var appRetrieval = AppRetrievalModel()
    @State private var showModal = false
    var body: some View {
        NavigationView {
            List {
                ForEach(appRetrieval.names, id: \.self) { name in
                    Text(name)
                }
            }
            .navigationTitle("Builds")
            .navigationBarItems(
                trailing:
                NavigationLink(
                    destination: AccountListView()
                        .environment(\.managedObjectContext, persistenceController.container.viewContext),
                    label: {
                        Image(systemName: "plus.app.fill")
                                .resizable()
                                .frame(width: 40, height: 40, alignment: .center)
                    })
//                Button(action: {
//                    self.showModal = true
//                }, label: {
//                Image(systemName: "plus.app.fill")
//                    .resizable()
//                    .frame(width: 40, height: 40, alignment: .center)
//                })
            ).sheet(isPresented: $showModal, onDismiss: {
                print(self.showModal)
            }) {
                Text("This is Modal view")
            }
        }
    }
}

struct AppListView_Previews: PreviewProvider {
    
    static var previews: some View {
        AppListView()
    }
}
