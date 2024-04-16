//
//  main.swift
//  demotool
//
//  Created by Michael Rockhold on 4/14/24.
//

import Foundation
import Speech

func getAuthorization() async throws -> SFSpeechRecognizerAuthorizationStatus {
    return await withCheckedContinuation(function: "getAuthorization") { continuation in
        SFSpeechRecognizer.requestAuthorization { status in
            continuation.resume(with: .success(status)) // always "succeeds", as Error type is Never
        }
    }
}

print("Hello, World!")

do {
    let r = try await getAuthorization()

    switch r {
    case .authorized:
        print("Speech Recognition is authorized.")

    default:
        print("Speech Recognition is not authorized: \(r)")
    }
} catch {
    print("Error attempting to authorize Speech Recognition: \(error)")
}

print("All done")
