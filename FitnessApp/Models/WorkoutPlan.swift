//
//  WorkoutPlan.swift
//  FitnessApp
//
//  Created by emmanuel.jimenez on 04/02/25.
//

import Foundation

struct WorkoutPlan: Decodable {
    let days: [DayStruct]
}

struct DayStruct: Decodable {
    let dayName: String
    let routine: [Exercise]
    let routineName: String
}

struct Exercise: Decodable {
    
    let exercise: String
    let series: Int
    let reps: Int
    
}
