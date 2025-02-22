//
//  CoreDataManager.swift
//  ChildrenInfoApp
//
//  Created by Rubin Vadim on 20.02.2025.
//

import UIKit
import CoreData

class CoreDataManager {
    
    static let shared = CoreDataManager()
    
    private init() {}
    
    static let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    func saveChild(name: String, age: String, completed: @escaping (ErrorMessages?) -> Void) {
        
        let newChild = ChildObject(context: CoreDataManager.context)
        newChild.name = name
        newChild.age = age
        
        //сохраняем CoreData
        do {
            try CoreDataManager.context.save()
            return
        }
        //или передаем ошибку
        catch {
            completed(.cantSaveData)
        }
    }
    
    func retrieveChildren(completed: @escaping (Result<[ChildObject], ErrorMessages>) -> Void) {
        do {
            let request = ChildObject.fetchRequest() as NSFetchRequest<ChildObject>
            let sort = NSSortDescriptor(key: "name", ascending: true)
            request.sortDescriptors = [sort]
            let children = try CoreDataManager.context.fetch(request)
            completed(.success(children))
        }
        catch {
            completed(.failure(.cantRetriveData))
        }
    }
    
    func deleteChild(child: ChildObject, completed: @escaping (ErrorMessages?) -> Void) {
        
        CoreDataManager.context.delete(child)
        do {
            try CoreDataManager.context.save()
            return
        }
        catch {
            completed(.cantDeleteData)
        }
    }
}
