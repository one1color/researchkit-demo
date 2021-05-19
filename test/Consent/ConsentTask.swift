//
//  ConsentTask.swift
//  test
//
//  Created by koki isshiki on 11.05.21.
//

import Foundation
import ResearchKit

public var ConsentTask: ORKOrderedTask{
    
    var steps = [ORKStep]()

    //Visualization
    //This step is where Apple will help us present the consent document with animations
    let consentDocument = ConsentDocument
    let visualConsentStep = ORKVisualConsentStep(identifier: "VisualConsentStep", document: consentDocument)
    steps += [visualConsentStep]
    
    //Request Health Data
    //We will need the user to grant us access to health data for collection
    
    //Review & Sign
    //The whole document will be shown to the user and the user will draw their signature on the touch screen
    let signature = consentDocument.signatures!.first!
    let reviewConsentStep = ORKConsentReviewStep(identifier: "ConsentReviewStep", signature: signature, in: consentDocument)
    reviewConsentStep.text = "Review the consent form."
    reviewConsentStep.reasonForConsent = "Consent to join study"
    steps += [reviewConsentStep]
    
    //Passcode/TouchID Protection
    //Because it is personal data
    
    //Completion
    //A thank you message
    let completionStep = ORKCompletionStep(identifier: "CompletionStep")
    completionStep.title = "Welcome aboard."
    completionStep.text = "Thank you for joining this study."
    steps += [completionStep]
    
    return ORKOrderedTask(identifier: "ConsentTask", steps: steps)
}
