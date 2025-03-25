//
//  Budget.swift
//  BudgetMaster
//
//  Created by William Barr on 3/25/25.
//
import SwiftUI

class Budget: ObservableObject, Identifiable {
   ////////////////////////////////////////////////////////
   var id: UUID = UUID()
   var name: String
   @Published var transactions: Int
   var averageTransactionAmount: Double {
      if (transactions > 0) {
         return totalExpended / Double(transactions)
      }
      return 0
   }
   @Published private var allowance: Double
   @Published private var totalExpended: Double
   @Published private var addedAllowance: Double
   
   ////////////////////////////////////////////////////////
   init(name: String, allowance: Double = 0) {
      self.allowance = allowance
      self.totalExpended = 0
      self.name = name
      self.transactions = 0
      self.addedAllowance = 0
   }
   
   ////////////////////////////////////////////////////////
   func expendBudget(amount: Double) {
      self.totalExpended += amount
      transactions += 1
   }
   
   func getAllowance() -> Double {
      return self.allowance
   }
   
   func getBudgetLeft() -> Double {
      return allowance - totalExpended + addedAllowance
   }
   
   func resetBudget() {
      self.totalExpended = 0
      self.transactions = 0
      self.addedAllowance = 0
   }
   
   func addToBudget(amount: Double) {
      self.addedAllowance += amount
   }
   
   func changeBudgetAllowance(amount: Double) {
      self.allowance = amount
   }
}
