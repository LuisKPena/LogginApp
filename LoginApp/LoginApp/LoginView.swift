//
//  LoginView.swift
//  LoginApp
//
//  Created by Kharlo Pena on 6/28/23.
//

import SwiftUI
import FirebaseAuth

struct LoginView: View {

    //---------------------------------------------
    //Variables
    //---------------------------------------------
    @State private var isCreateAccountViewPresented = false
    @State private var isPasswordCorrect: Bool = false
    @State private var showErrorAlert: Bool = false
    
    @State private var email: String = ""
    @State private var password: String = ""

    var body: some View {
        NavigationStack{
            
            ZStack{
                //---------------------------------------------
                //Background Image
                //---------------------------------------------
                Image("LoginBackGround")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                
                VStack{
                    //---------------------------------------------
                    //Login Text
                    //---------------------------------------------
                    Text("Login")
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.white)
                    
                    //---------------------------------------------
                    //Spacers
                    //---------------------------------------------
                    Spacer()
                    Spacer()
                    
                    //---------------------------------------------
                    //Email Field
                    //---------------------------------------------
                    HStack{
                        
                        Image(systemName: "mail")
                            .foregroundColor(.white)
                        TextField("Email", text: $email)
                            .foregroundColor(.white)
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
                                .foregroundColor(.white)
                        ).padding()
                    
                    //---------------------------------------------
                    //Password Field
                    //---------------------------------------------
                    HStack{
                        
                        Image(systemName: "lock")
                            .foregroundColor(.white)
                        TextField("Password", text: $password)
                            .foregroundColor(.white)
                            .font(.title)
                            .fontWeight(.bold)
                        
                    }.padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(lineWidth: 2)
                                .foregroundColor(.white)
                        ).padding()
                    
                    //---------------------------------------------
                    //New Account Button
                    //---------------------------------------------
                    Button(action:{
                        isCreateAccountViewPresented.toggle()
                    }){
                        Text("Create Account")
                    }.foregroundColor(.white)
                        .font(.title)
                        .sheet(isPresented: $isCreateAccountViewPresented){
                            NewAccountView()
                        }
                    
                    //---------------------------------------------
                    //Spacers
                    //---------------------------------------------
                    Spacer()
                    Spacer()
                    
                    //---------------------------------------------
                    //Login Button
                    //---------------------------------------------
                    Button(action:{
                        
                        Auth.auth().signIn(withEmail: email, password: password){authResult, error in
                            
                            if let error = error{
                                print(error)
                                email = ""
                                password = ""
                                showErrorAlert.toggle()
                            }
                            
                            if let authResult = authResult{
                                isPasswordCorrect = true
                            }
                        }//End Sign In
                    }){
                        Text("Login")
                            .foregroundColor(.white)
                            .font(.title)
                            .bold()
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 25)
                                    .fill(Color.black)
                                    .foregroundColor(.black)
                                    .opacity(0.5)
                            ).padding(.horizontal)
                        
                            .alert(isPresented: $showErrorAlert, content:{
                                Alert(title: Text("Login Error: Please check email and password!"))
                            })
                    }
                    .padding()
                    .padding(.top)
                }//End VStack
                
            }//End ZStack
            
            //---------------------------------------------
            //Navigation Link
            //---------------------------------------------
            NavigationLink(destination: InsideAppView(), isActive: $isPasswordCorrect){
                EmptyView()
            }
            
        }//End NavigationStack
        
    }//End Body
    
}//End LoginView

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
