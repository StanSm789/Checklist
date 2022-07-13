//
//  ChecklistApp.swift
//  Checklist
//
//  Created by Stanislav Smirnov on 20/4/2022.
//

import SwiftUI
/**
This struct is an entry point for the **Checklist** app.
 
 This struct includes:
 - **@State (var model)** of the app which is connected to the child views via @Binding in child structs;
 - Static variable **model** for getting (decoding) existing data from a JSON file;
 - **Scene** that provides a first scene for the app;
 - **FileURL** for the document directory;
 - **Save** function that is used to save (encode) changes in a JSON file;
     
*/
@main
struct ChecklistApp: App {
    /// this variable is a state of the app, which is equal to what is retrieve from the JSON file
    @State var model: [ChecklistViewModel] = ChecklistApp.model
    /// this variable stores that data that is retrieved (in closure) from the JSON file.
    /// If the decoding process is unsuccessful, the closure returns pre-defined list of Checklists
    static var model: [ChecklistViewModel] = {
        guard let data  = try? Data(contentsOf: ChecklistApp.fileURL),
              let model = try? JSONDecoder().decode([ChecklistViewModel].self, from: data) else {
            return [ChecklistViewModel(checklist: Checklist(name: "A", items: [])), ChecklistViewModel(checklist: Checklist(name: "B", items: [])), ChecklistViewModel(checklist: Checklist(name: "C", items: [])), ChecklistViewModel(checklist: Checklist(name: "D", items: [])), ChecklistViewModel(checklist: Checklist(name: "E", items: []))]
        }
        return model
    }()
    
    /// Connection between a property that stores data, and a view that displays and changes the data
    static var modelBinding: Binding<[ChecklistViewModel]>?
    
    /// the first scene for the app, which passes the model into ContentView
    var body: some Scene {
        ChecklistApp.modelBinding = $model
        return WindowGroup {
            NavigationView {
            ContentView(checklists: $model)
            }
        }
    }

    /// file URL for the document directory (where the JSON file is stored)
    static var fileURL: URL {
        let fileName = "checklist.json"
        let fm = FileManager.default
        guard let documentDir = fm.urls(for: .documentDirectory, in: .userDomainMask).first else { return URL(fileURLWithPath: "/") }
        let fileURL = documentDir.appendingPathComponent(fileName)
        return fileURL
    }

    /// this function saves data in the JSON file. It is used in View structs (ContentVIew, MasterView, DetailView)
    static func save() {
        do {
            let data = try JSONEncoder().encode(modelBinding?.wrappedValue ?? model)
            try data.write(to: fileURL, options: .atomic)
            guard let dataString = String(data: data, encoding: .utf8) else { return }
            print(dataString)
        } catch {
            print("Could not write file: \(error)")
        }
    }
}
