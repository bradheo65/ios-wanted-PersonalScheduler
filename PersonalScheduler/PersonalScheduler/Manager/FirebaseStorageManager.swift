//
//  FirebaseStorageManager.swift
//  PersonalScheduler
//
//  Created by brad on 2023/01/09.
//

import Foundation
import FirebaseFirestore

final class FirebaseStorageManager {
    
    private enum FirebaseQuery {
        static let collection = "ScheduleList"
    }
    
    private var db = Firestore.firestore()
    var posts = [ScheduleList]()
    
    func uploadPost(accountUID: String, title: String, description: String, startTimeStamp: Date, endTimeStamp: Date) {
        let postId = UUID().uuidString
        
        let post = ScheduleList(
            id: postId,
            title: title,
            description: description,
            startTimeStamp: startTimeStamp.translateToString(),
            endTimeStamp: endTimeStamp.translateToString()
        )
            
        let _ = db.collection(FirebaseQuery.collection)
            .document(accountUID)
            .collection("collection")
            .document(postId)
            .setData(post.dictionary)
    }
    
    func fetchScheduleList(accountUID: String, completion: @escaping ([ScheduleList]) -> Void) {
        db.collection(FirebaseQuery.collection)
            .document(accountUID)
            .collection("collection")
            .addSnapshotListener { [weak self] (querySnapshot, error) in
                if let documents = querySnapshot?.documents {
                    self?.posts = documents.map({ (queryDocumentSnapshot) -> ScheduleList in
                        let data = queryDocumentSnapshot.data()
                        let id = data["id"] as? String ?? "blank id"
                        let title = data["title"] as? String ?? "blank title"
                        let description = data["description"] as? String ?? "black description"
                        let startTimeStamp = data["startTimeStamp"] as? String ?? "blank startTimeStamp"
                        let endTimeStamp = data["endTimeStamp"] as? String ?? "blank endTimeStamp"
                        
                        return ScheduleList(id: id, title: title, description: description, startTimeStamp: startTimeStamp, endTimeStamp: endTimeStamp)
                    })
                } else {
                    print("No Documents")
                }
                completion(self!.posts)
            }
    }
    
    func deleteScheduleList(accountUID: String, uuid: String) {
        db.collection(FirebaseQuery.collection).document(accountUID).collection("collection").document(uuid).delete()
    }
}
