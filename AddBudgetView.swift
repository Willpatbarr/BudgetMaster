//
//  AddBudgetView.swift
//  BudgetMaster
//
//  Created by William Barr on 3/25/25.
//

import SwiftUI

struct AddBudgetView: View {
   
   @Binding var budgets: [Budget]
   @Environment(\.dismiss) var dismiss
   @State private var allowance: String = ""
   @State private var name: String = ""
   
   var body: some View {
      VStack {
         HStack {
            Text("Add Budget")
               .font(.headline)
            Spacer()
            Button(action: { dismiss() }) {
               Text("Cancel")
            }
         }
         .padding()
         
         TextField("Enter Budget Name", text: $name)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding()
         
         TextField("Enter Allowance", text: $allowance)
            .keyboardType(.decimalPad)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding()
         
         Button(action: {
            saveBudget(name: name, allowance: allowance)
            dismiss()
         }) {
            Text("Done")
         }
         
         Spacer()
      }
   }
}

extension AddBudgetView {
   func saveBudget(name: String, allowance: String) {
      let newBudget = Budget(name: name, allowance: Double(allowance) ?? 0)
      budgets.append(newBudget)
   }
}
