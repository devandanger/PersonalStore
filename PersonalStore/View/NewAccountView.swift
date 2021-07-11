//
//  NewAccountView.swift
//  PersonalStore
//
//  Created by Evan Anger on 7/10/21.
//

import SwiftUI

struct NewAccountView: View {
    @State var address: String = ""
    @State var apiKey: String = ""
    
    @State var showCamera: Bool = false
    var body: some View {
        NavigationView {
            VStack {
                TextField("Email Address", text: $address)
                    .padding(5)
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
    }
}

struct NewAccountView_Previews: PreviewProvider {
    static var previews: some View {
        NewAccountView()
    }
}
