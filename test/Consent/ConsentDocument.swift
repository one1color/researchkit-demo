//
//  ConsentDocument.swift
//  test
//
//  Created by koki isshiki on 11.05.21.
//

import ResearchKit

public var ConsentDocument: ORKConsentDocument{
    
    let consentDocument = ORKConsentDocument()
    consentDocument.title = "Research Study Consent Form" //Or other title you prefer
    
    let sectionTypes: [ORKConsentSectionType] = [
        .overview,
        .dataGathering,
        .privacy,
        .dataUse,
        .timeCommitment,
        .studySurvey,
        .studyTasks,
        .withdrawing
    ]
    
    //Section contents
    let text = [
        "Section 1: Welcome to this survey. This study is about...",
        "Section 2: Data Gathering. This study will collect data from your Apple Watch...",
        "Section 3: Privacy. We value your privacy...",
        "Section 4: Data Use. The data collected will be used for...",
        "Section 5: Time Commitment. This study will take you roughly...",
        "Section 6: Study Survey. For this study, you will need to fill out a survey...",
        "Section 7: Study Tasks. You will be requested to do these tasks...",
        "Section 8: Withdrawing. To withdraw from the study..."
    ]
    //Add sections
    for sectionType in sectionTypes {
        let section = ORKConsentSection(type: sectionType)
        
        let localizedText = NSLocalizedString(text[sectionTypes.firstIndex(of: sectionType)!], comment: "")
        let localizedSummary = localizedText.components(separatedBy: ".")[0] + "."
        
        section.summary = localizedSummary
        section.content = localizedText
        //section.
        
        if consentDocument.sections == nil {
            consentDocument.sections = [section]
        } else {
            consentDocument.sections!.append(section)
        }
    }
    //Signature
    consentDocument.addSignature(ORKConsentSignature(forPersonWithTitle: "Participant", dateFormatString: nil, identifier: "ConsentDocumentParticipantSignature"))
    
    
    return consentDocument
}
