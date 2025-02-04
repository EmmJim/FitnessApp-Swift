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
    let routine: [RoutineStruct]
    let routineName: String
}

struct RoutineStruct: Decodable {
    
    let exercise: String
    let series: Int
    let reps: Int
    
}
