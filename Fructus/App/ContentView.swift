//
//  ContentView.swift
//  Fructus
//
//  Created by Joep Hinderink on 25/12/2020.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: - PROPERTIES
    
    var fruits: [Fruit] = fruitsData
    @State private var isShowingSettings = false
    
    // MARK: - BODY

    var body: some View {
        NavigationView {
            List {
                ForEach(fruits.shuffled()) { item in
                    NavigationLink (
                        destination: FruitDetailView(fruit: item)) {
                    FruitRowView(fruit: item)
                        .padding(.vertical, 4)
                }
                } //: ForEach
            } //: List
            .navigationTitle("Fruits")
            .navigationBarItems(trailing:
                                    Button (action: {
                                        isShowingSettings = true }){
                                        Image(systemName: "slider.horizontal.3")
                                    } //: BUTTON
                                    .sheet(isPresented: $isShowingSettings, content: {
                                        SettingsView()
                                    })
            )
        } //: NAVIGATION
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

// MARK: - PREVIEW

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(fruits: fruitsData)
    }
}
