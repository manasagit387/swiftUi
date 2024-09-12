//
//  ContentView.swift
//  swiftUIProject
//
//  Created by apple on 12/09/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var activities = ["Archery", "Baseball", "Basketball", "Bowling", "Boxing", "Cricket", "Fencing", "Curling", "Golf", "Hiking", "Lacrosse", "Rugby", "Squash"]
    @State private var selected = "Baseball"
    
    @State private var id = UUID()
   
    private let activityImages: [String: String] = [
        "Archery": "figure.archery",
        "Baseball": "figure.baseball",
        "Basketball": "figure.basketball",
        "Bowling": "figure.bowling",
        "Boxing": "figure.boxing",
        "Cricket": "figure.cricket",
        "Fencing": "figure.fencing",
        "Curling": "figure.curling",
        "Golf": "figure.golf",
        "Hiking": "figure.hiking",
        "Lacrosse": "figure.lacrosse",
        "Rugby": "figure.rugby",
        "Squash": "figure.squash"
    ]
    
    var body: some View {
        VStack {
            Text("Why not try..")
                .font(.largeTitle.bold())
            
            VStack {
                Circle()
                    .fill(Color.blue)
                    .padding()
                    .overlay {
                        Image(systemName: activityImages[selected] ?? "questionmark.circle")
                            .font(.system(size: 144))
                            .foregroundColor(.white)
                    }
                    .transition(.slide)
                    .id(id)
                
                Text("\(selected)!")
                    .font(.title)
                
                Button("Try again") {
                    withAnimation(.easeInOut(duration: 1)) {
                        selected = activities.randomElement() ?? "Archery"
                        id = UUID() 
                    }
                }
                .buttonStyle(.borderedProminent)
            }
        }
    }
}

#Preview {
    ContentView()
}
