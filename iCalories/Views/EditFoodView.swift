//
//  EditFoodView.swift
//  iCalories
//
//  Created by Krish Mittal on 09/05/24.
//

import SwiftUI

struct EditFoodView: View {
    @Environment (\.managedObjectContext) var managedObjContext
    @Environment (\.dismiss) var dismiss
    
    var food: FetchedResults<Food>.Element
    
    @State private var name = ""
    @State private var colories: Double = 0
    
    var body: some View {
        Form {
            Section {
                TextField("\(food.name)", text: $name)
                    .onAppear {
                        name = food.name!
                        colories = food.calories
                    }
                VStack {
                    Text("Calories: \(Int(colories))")
                    Slider(value: $colories, in: 0...1000, step: 10)
                }
                .padding()
                
                HStack {
                    Spacer()
                    Button("Submit") {
                        DataController().editFood(food: food, name: name, calories: colories, context: managedObjContext)
                    }
                    Spacer()
                }
            }
        }
    }
}
