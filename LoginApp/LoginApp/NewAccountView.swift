//
//  NewAccountView.swift
//  LoginApp
//
//  Created by Kharlo Pena on 6/28/23.
//

import FirebaseAuth
import SwiftUI

struct NewAccountView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        
        VStack{
            //---------------------------------------------
            //New Account Text
            //---------------------------------------------
            Text("New Account")
                .font(.largeTitle)
            
            //---------------------------------------------
            //Spacer
            //---------------------------------------------
            Spacer()
            
            //---------------------------------------------
            //Email Field
            //---------------------------------------------
            HStack{
                
                Image(systemName: "mail")
                    .foregroundColor(.gray)
                TextField("Email", text: $email)
                    .foregroundColor(.gray)
                    .font(.title)
                    .fontWeight(.bold)
                
                if(email.count != 0){
                    Image(systemName: email.isValidEmail() ? "checkmark" : "xmark")
                        .frame(width: 30)
                        .fontWeight(.bold)
                        .foregroundColor(email.isValidEmail() ? .green : .red)
                }
                
            }.padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(lineWidth: 2)
                        .foregroundColor(.black)
                ).padding()
            
            //---------------------------------------------
            //Password Field
            //---------------------------------------------
            HStack{
                
                Image(systemName: "lock")
                    .foregroundColor(.gray)
                TextField("Password", text: $password)
                    .foregroundColor(.gray)
                    .font(.title)
                    .fontWeight(.bold)
                
            }.padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(lineWidth: 2)
                        .foregroundColor(.black)
                ).padding()
            
            //---------------------------------------------
            //Cancel & Create Account Buttons
            //---------------------------------------------
            HStack{
                
                //---------------------------------------------
                //Cancel Account Button
                //---------------------------------------------
                Spacer()
                
                Button(action:{
                    
                    presentationMode.wrappedValue.dismiss()
                }){
                    Text("Cancel")
                        .foregroundColor(.gray)
                        .font(.title)
                }
                
                //---------------------------------------------
                //Create Account Button
                //---------------------------------------------
                Spacer()
                
                Button(action:{
                    Auth.auth().createUser(withEmail: email, password: password){authResult, error in
                        
                        if let error = error{
                            print(error)
                            
                            return
                        }
                        
                        if let authResult = authResult{
                            print("\(authResult.user.uid)")
                        }
                    }
                    
                    presentationMode.wrappedValue.dismiss()
                }){
                    Text("Create Account")
                        .foregroundColor(.gray)
                        .font(.title)
                }
                
                Spacer()
                
            }//End HStack
            
            //---------------------------------------------
            //Spacer
            //---------------------------------------------
            Spacer()
            
        }//End VStack
        
    }//End Body
    
}//End View

struct NewAccountView_Previews: PreviewProvider {
    static var previews: some View {
        NewAccountView()
    }
}
