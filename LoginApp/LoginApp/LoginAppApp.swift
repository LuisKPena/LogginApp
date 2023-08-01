//=============================================================================
// PROGRAMMER: Luis K. Pena
// PANTHER ID: 6300130
//
// CLASS: COP4655
// SECTION: RVCC
// SEMESTER: Summer 2023
// CLASSTIME: Online
//
// Project: HW 5
//
// CERTIFICATION: I understand FIU’s academic policies, and I certify that this work is my
//                 own and that none of it is the work of any other person.
//=============================================================================

import SwiftUI
import FirebaseCore

@main
struct LoginAppApp: App {
    
    //---------------------------------------------
    //Firebase Configuration
    //---------------------------------------------
    init(){
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            LoginView()
        }
    }
}
