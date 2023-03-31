//
//  ContentView.swift
//  SwiftUI Camera App
//
//  Created by Lori Rothermel on 3/29/23.
//

import SwiftUI
import PhotosUI


struct ContentView: View {
    @State private var showSheet: Bool = false
    @State private var showImagePicker: Bool = false
    @State private var sourceType: UIImagePickerController.SourceType = .camera
    @State private var image: UIImage?
    
    
    var body: some View {
        
        NavigationStack {
            VStack {
                      
                
                Image(uiImage: image ?? UIImage(named: "placeholder")!)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 300)
                    .foregroundColor(.blue)

                Button("Choose Picture") {
                    showSheet = true
                    
                }
                .padding()
                .actionSheet(isPresented: $showSheet) {
                    ActionSheet(title: Text("Select Photo"),
                                message: Text("Choose"),
                                buttons: [
                                            .default(Text("Photo Library")) {
                                                showImagePicker = true
                                                self.sourceType = .photoLibrary
                                            },
                                            .default(Text("Camera")) {
                                                showImagePicker = true
                                                self.sourceType = .camera
                                            },
                                            .cancel()
                                         ])
                }
                        
            }  // VStack
            .navigationTitle("Camera Demo")
                
        }  // NavigationStack
        .sheet(isPresented: $showImagePicker) {
            ImagePicker(image: self.$image, isShown: self.$showImagePicker, sourceType: self.sourceType)
        }
    }  // some View
}  // ContentView




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
