//
//  AddExpenseView.swift
//  BudgetMaster
//
//  Created by William Barr on 3/25/25.
//

import SwiftUI

struct AddExpenseView: View {
   
   @ObservedObject var budget: Budget
   @State private var amount: String = ""
   @FocusState private var isFocused: Bool
   @Environment(\.dismiss) var dismiss
   
   var body: some View {
      VStack() {
         Text("Enter Expense Cost")
            .font(.headline)
         
         TextField("0.00", text: $amount)
            .keyboardType(.decimalPad)
            .focused($isFocused)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding(.horizontal)
         Button(action: {
            budget.expendBudget(amount: Double(amount) ?? 0)
            dismiss()
         }) {
            Text("Save")
         }
      }
      .onAppear {
         DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            isFocused = true
         }
      }
   }
}
