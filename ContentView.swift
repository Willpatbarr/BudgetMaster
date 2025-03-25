//
//  ContentView.swift
//  BudgetMaster
//
//  Created by William Barr on 3/25/25.
//

import SwiftUI

let testBudget = Budget(name: "Test Budget", allowance: 100.00)
let testBudget2 = Budget(name: "Test Budget 2", allowance: 102.00)

struct ContentView: View {
   
   @State var budgets: [Budget] = [testBudget, testBudget2]
   
   @State var showingAddBudgetView: Bool = false
   
    var body: some View {
       
       HStack {
          Text("Budgets")
             .font(.largeTitle)
          Spacer()
          Button(action: {
             showingAddBudgetView = true
          }) {
             Image(systemName: "plus")
                .font(.title)
          }
          .sheet(isPresented: $showingAddBudgetView) {
             AddBudgetView(budgets: $budgets)
                .presentationDetents([.height(250)])
          }
       }
       .padding()
       Divider()
       ScrollView {
          VStack {
             ForEach(budgets) { budget in
                BudgetView(budget: budget)
                Divider().padding([.horizontal], 15)
             }
             Spacer()
          }
       }
    }
}
