//
//  AddFoodView.swift
//  iCalories
//
//  Created by Krish Mittal on 09/05/24.
//

import SwiftUI

struct AddFoodView: View {
    @Environment (\.managedObjectContext) var managedObjContext
    @Environment (\.dismiss) var dismiss
    
    @State private var name = ""
    @State private var calories: Double = 0
    
    var body: some View {
        Form {
            Section {
                TextField("Food Name", text: $name)
                
                VStack {
                    Text("\(Int(calories))")
                    Slider(value: $calories, in: 0...100, step: 10)
                }
                .padding()
                
                HStack {
                    Spacer()
                    Button("Submit") {
                        DataController().addFood(name: name, calories: calories, context: managedObjContext)
                        dismiss()
                    }
                    Spacer()
                }
            }
        }
    }
}

#Preview {
    AddFoodView()
}
