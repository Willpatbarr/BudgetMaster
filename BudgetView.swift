//
//  BudgetView.swift
//  BudgetMaster
//
//  Created by William Barr on 3/25/25.
//

import SwiftUI

struct BudgetView: View {
   
   @ObservedObject var budget: Budget
   @State var budgetDetailsVisible: Bool = false
   @State var changeAllowanceVisible: Bool = false
   @State var addMoneyVisible: Bool = false
   @State var addExpenseVisible: Bool = false
   
   var body: some View {
      VStack {
         HStack {
            Text(budget.name)
               .font(.title2)
            Spacer()
            Text("$\(budget.getBudgetLeft(), specifier: "%.2f")")
               .font(.title2)
         }
         .padding()
         .background(Color.clear) // Keeps it invisible
         .contentShape(Rectangle()) // Makes the full area tappable
         
         .onTapGesture {
            withAnimation(.spring(response: 0.4, dampingFraction: 0.7)) {
               budgetDetailsVisible.toggle()
            }
         }
         if (budgetDetailsVisible == true) {
            VStack(spacing: 20) {
               HStack {
                  Text("Budget Allowance:").font(.footnote)
                  Spacer()
                  Text("$\(budget.getAllowance(), specifier: "%.2f")").font(.footnote)
               }
               Divider().padding([.horizontal], 8)
               HStack {
                  Text("Transactions:").font(.footnote)
                  Spacer()
                  Text("\(budget.transactions)").font(.footnote)
               }
               Divider().padding([.horizontal], 8)
               HStack {
                  Text("Average Cost Per Transaction:").font(.footnote)
                  Spacer()
                  Text("$\(budget.averageTransactionAmount, specifier: "%.2f")").font(.footnote)
               }
               Divider().padding([.horizontal], 8)
               HStack {
                  Spacer()
                  Button(action: { budget.resetBudget() }) { Image(systemName: "arrow.trianglehead.clockwise") }
                     
                  Spacer()
                  Button(action: { changeAllowanceVisible = true }) { Image(systemName: "pencil") }
                     .sheet(isPresented: $changeAllowanceVisible) {
                        ChangeAllowanceView(budget: budget)
                           .presentationDetents([.height(200)])
                     }
                  Spacer()
                  Button(action: { addMoneyVisible = true }) { Image(systemName: "plus") }
                     .sheet(isPresented: $addMoneyVisible) {
                        AddMoneyView(budget: budget)
                           .presentationDetents([.height(200)])
                     }
                  Spacer()
                  Button(action: { addExpenseVisible = true }) { Image(systemName: "minus") }
                     .sheet(isPresented: $addExpenseVisible) {
                        AddExpenseView(budget: budget)
                           .presentationDetents([.height(200)])
                     }
                  Spacer()
               }
            }
            .padding()
            .background(Color(.systemGray6))
         }
      }
   }
}
