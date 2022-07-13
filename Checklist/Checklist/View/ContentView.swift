//
//  ContentView.swift
//  Checklist
//
//  Created by Stanislav Smirnov on 20/4/2022.
//

import SwiftUI
/**
This struct is a part of the View and is used to dispaly a representation of the model and receive the user's interaction with the view.
     
     This is the top component of the View, which also includes MasterView and DetailView.
     ContentView --> MasterView --> DetailView.
     Together with MasterView, it is used to display list of checklists.

*/
struct ContentView: View {
    /// This variable is a two way connection between data storage and the view
    @Binding var checklists: [ChecklistViewModel]
    
    /**
     **Checklists** variable is passed into an instance of a struct MasterView
     It also has two buttons: **Edit** and **Plus**. The former acrtivates edit mode, whereas the latter allows to add a new Checklist
    */
    var body: some View {
        MasterView(checklists: $checklists)
            .navigationBarItems(leading: EditButton(), trailing: Button(action: { checklists.append(ChecklistViewModel(checklist: Checklist(name: "New", items: [])))
                /// saving the current state in a JSON file
                ChecklistApp.save()
        }, label: { Image(systemName: "plus") }))
    }
}
