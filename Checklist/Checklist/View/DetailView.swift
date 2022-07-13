//
//  DetailView.swift
//  Checklist
//
//  Created by Stanislav Smirnov on 20/4/2022.
//

import SwiftUI
/**
This struct is a part of the View and is used to dispaly a representation of the model and receive the user's interaction with the view.
     
     This is a third component of the View, which also includes ContentView and MasterView.
     ContentView --> MasterView --> DetailView.
     It displays all items of a checklist.
*/
struct DetailView: View {
    /// variable stores name of the checklist
    @Binding var name: String
      /// variable stores checklist details
    @Binding var checklist: ChecklistViewModel
    /// varible stores name of a new item when it gets added into checklist
    @State var newItemName: String = ""
    //// variable is used as a part of **Reset** functionality when all items are getting unticked
    @State var flag: Bool = true
    /// variable is used to activate edit mode
    @Environment(\.editMode) var editMode
    
    var body: some View {
        
        /**
            Inside a VStack  there is a ForEach loop that dispays all items of the checklist.
            It also contains code that allows to move, delete add and tick new items, as well as edit the checklist name
        */
        VStack {
            List {
                /// looping through all items of a checklist and displaying them immediately
                ForEach($checklist.checklist.items, id: \.self) { item in
                    HStack {
                        /// when flag is true all items display their tick or its absence
                        if flag {
                        Text(item.name.wrappedValue)
                    Spacer()
                        Text(item.isTicked.wrappedValue ? "✅" : "")
                        /// when flag is equals to flase all items are getting unticked, and this state is saved in  the JSON file
                        } else {
                            Text(item.name.wrappedValue)
                        Spacer()
                            Text(item.isTicked.wrappedValue ? "" : "").onAppear() {
                                item.isTicked.wrappedValue = false
                                ChecklistApp.save()
                            }
                        }
                    /// block of code for ticking/unticking items
                    }.onTapGesture {
                        withAnimation(.linear) {
                            item.isTicked.wrappedValue.toggle()
                            ChecklistApp.save()
                        }
                    }
                /// block of code for moving items
                }.onMove {
                    checklist.checklist.items.move(fromOffsets: $0, toOffset: $1)
                    ChecklistApp.save()
                }
                /// block of code for deleting items
                .onDelete {
                    checklist.checklist.items.remove(atOffsets: $0)
                    ChecklistApp.save()
                }
                /// block of code for adding new item in Edit mode
                if editMode?.wrappedValue == .active {
                    HStack{
                    Image(systemName: "plus")
                        .foregroundColor(.green)
                    TextField("Add Item", text: $newItemName) {
                        checklist.checklist.items.append(Item(name: newItemName, isTicked: false))
                        ChecklistApp.save()
                        newItemName = ""
                                }
                            }
                        }
                /// block of code for changing the name of the checklist in Edit mode
                if editMode?.wrappedValue == .active {
                    TextField(name ,text: $name) {
                        ChecklistApp.save()
                    }
                        .font(.title)
                        .foregroundColor(.red)
                }
                /// displaying navigation title
            }.navigationTitle($checklist.checklist.name.wrappedValue)
            /// Edit button + code for Reset button
        }.toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
            EditButton()
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                /// if Reset button is pressed flag is changed from true to fasle.
                /// in the ForEach loop all items are getting unticked, and then the flag becomes true again after 10 milliseconds
                if editMode?.wrappedValue == .active{
                Button(action: { flag = false; DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(10)) {
                    flag = true
                }}, label: { Text("Reset") })
                }
            }
        }
    }
    
}
