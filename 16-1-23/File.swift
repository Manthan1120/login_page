
import Foundation
import SQLite3


struct Data {
  var firstName: String
  var name: String
}


class Sqlite {
    static var file : OpaquePointer?

   static func createFile() {
       var x = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
       x.appendPathComponent("My Sqlite file3.db")
       sqlite3_open(x.path, &file)
       print(x.path)
       print("Create file")
       createTable()
           
    }
   static func createTable() {
       let q = "Create Table if not exists Students (name text,id integer)"
       var table: OpaquePointer?
       sqlite3_prepare(file, q, -1, &table, nil)
       print("Create table")
       sqlite3_step(table)
       
        
    }
    static func addData(firstName:String,name:String) {
       let q = "insert into Students values ('\(name)','\(firstName)')"
       var data: OpaquePointer?
       sqlite3_prepare(file, q, -1, &data, nil)
       print("Create data")
       sqlite3_step(data)
       
        
    }
    static func getData()->[Data] {
        var arr = [Data]()
        let q = "select name,firstName from Students"
        var get: OpaquePointer?
        sqlite3_prepare(file, q, -1, &get, nil)
        
        while sqlite3_step(get) == SQLITE_ROW {
            let firstName = sqlite3_column_int64(get,1)
            print("firstName = \(firstName);",terminator: "")
            
            if let cString = sqlite3_column_text(get,0){
                let name = String(cString:cString)
                let firstName = String(cString:cString)
                arr.append(Data(firstName: firstName, name: name))
            }
        }
       print("Get data")
        return arr
    }
   static func delteData(firstName:String,name:String) {
       let q = "DELETE FROM Students WHERE firstName = \(firstName) "
       var table: OpaquePointer?
       sqlite3_prepare(file, q, -1, &table, nil)
       sqlite3_step(table)
       print("Delete data")
    }
}




