//
//  ToDo.swift
//  ToDoList
//
//  Created by DIMbI4 on 28.03.2022.
//

//import Foundation
import UIKit

struct ToDo: Equatable, Codable {
    let id: UUID
    var title: String
    var isComplete: Bool
    var dueDate: Date
    var notes: String?
    var link: String?
    
    init(title: String, isComplete: Bool, dueDate: Date, notes: String?, link: String?) {
        self.id = UUID()
        self.title = title
        self.isComplete = isComplete
        self.dueDate = dueDate
        self.notes = notes
        self.link = link
    }
    
    static let documentsDirectory =
    FileManager.default.urls(for: .documentDirectory,
                             in: .userDomainMask).first!
    static let archiveURL =
    documentsDirectory.appendingPathComponent("toDos")
        .appendingPathExtension("plist")

    static func ==(lhs: ToDo, rhs: ToDo) -> Bool {
        return lhs.id == rhs.id
    }
    
    static func loadToDos() -> [ToDo]? {
        guard let codedToDos = try? Data(contentsOf: archiveURL) else {return nil}
        let propertyListDecoder = PropertyListDecoder()
        return try? propertyListDecoder.decode(Array<ToDo>.self, from: codedToDos)
    }
    
    static func saveToDos(_ toDos: [ToDo]) {
        let propertyListEncoder = PropertyListEncoder()
        let codedToDos = try? propertyListEncoder.encode(toDos)
        try? codedToDos?.write(to: archiveURL, options: .noFileProtection)
    }
    
    static func loadSampleToDos() -> [ToDo] {
        let toDo1 = ToDo(title: "To-Do One", isComplete: false,
                         dueDate: Date(), notes: "Notes 1", link: "https://www.apple.com/")
        let toDo2 = ToDo(title: "To-Do Two", isComplete: false,
           dueDate: Date(), notes: "Notes 2", link: "https://www.apple.com/")
        let toDo3 = ToDo(title: "To-Do Three", isComplete: false,
           dueDate: Date(), notes: "Notes 3", link: "https://www.apple.com/")
        let toDo4 = ToDo(title: "To-Do Four", isComplete: false,
           dueDate: Date(), notes: "Notes 4", link: "https://www.apple.com/")
        let toDo5 = ToDo(title: "To-Do Five", isComplete: false,
           dueDate: Date(), notes: "Notes 5", link: "https://www.apple.com/")
        let toDo6 = ToDo(title: "To-Do Six", isComplete: false,
           dueDate: Date(), notes: "Notes 6", link: "https://www.apple.com/")
    
        return [toDo1, toDo2, toDo3, toDo4, toDo5, toDo6]
    }
}
