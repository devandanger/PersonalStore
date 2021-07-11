//
//  NewAccountView.swift
//  PersonalStore
//
//  Created by Evan Anger on 7/10/21.
//

import SwiftUI

struct NewAccountView: View {
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.managedObjectContext) private var viewContext

    @State var address: String = ""
    @State var apiKey: String = ""
    @State var showCamera: Bool = false
    var body: some View {
        NavigationView {
            VStack {
                TextField("Email Address", text: $address)
                    .padding(5)
                    .keyboardType(.emailAddress)
                HStack {
                    TextField("API Key", text: $apiKey) { editingChange in
                        if(editingChange) {
                            showCamera = true
                        }
                    }.padding(5)
                    Image(systemName: "barcode.viewfinder")
                        .resizable()
                        .frame(width: 40, height: 40, alignment: .center)
                }
                Spacer()
            }
            .padding(20)
            .navigationTitle("New Account")
        }.sheet(isPresented: $showCamera, content: {
            CameraView(showCamera: $showCamera, scanned: $apiKey)
        })
        .navigationBarItems(trailing: Button(action: {
            let newAccount = Account(context: viewContext)
            newAccount.apiKey = self.apiKey
            newAccount.emailAddress = self.address
            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
            
            presentationMode.wrappedValue.dismiss()
        }, label: {
            Text("Save")
        }).disabled(address.isEmpty || apiKey.isEmpty))
        
    }
}

struct NewAccountView_Previews: PreviewProvider {
    static var previews: some View {
        NewAccountView()
    }
}
