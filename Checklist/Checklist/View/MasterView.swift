//
//  MasterView.swift
//  Checklist
//
//  Created by Stanislav Smirnov on 20/4/2022.
//

import SwiftUI
/**
This struct is a part of the View and is used to dispaly a representation of the model and receive the user's interaction with the view.
     
     This is the second component of the View, which also includes ContentView and DetailView.
     ContentView --> MasterView --> DetailView.
     Together with ContentView, it is used to display list of checklists.
*/
struct MasterView: View {
    /// This variable is a two way connection between data storage and the view
    @Binding var checklists: [ChecklistViewModel]
    
    /**
        Inside a List container there is a ForEach loop that dispays a name of each checklist
        as well as provides an opportunity to go into each list (DetailView)
    */
    var body: some View {
        
            List{
                ForEach($checklists){checklist in
                    NavigationLink(destination:
                                    DetailView(name: checklist.checklist.name, checklist: checklist),
                        label: {Text("\(checklist.checklist.name.wrappedValue)")})
                /// this closure allows to dinamically move Checklists in the MasterView
                }.onMove {
                    checklists.move(fromOffsets: $0, toOffset: $1)
                    ChecklistApp.save()
                    /// this closure allows to delete checklists
                }.onDelete {
                    checklists.remove(atOffsets: $0)
                    ChecklistApp.save()
            }
        }
    }
}
