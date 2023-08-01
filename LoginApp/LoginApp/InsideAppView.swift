//
//  InsideAppView.swift
//  LoginApp
//
//  Created by Kharlo Pena on 6/28/23.
//

import SwiftUI

struct InsideAppView: View {
    var body: some View {
        
        VStack{
            //---------------------------------------------
            //Background Image
            //---------------------------------------------
            Image("MountainTrail")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            
            //---------------------------------------------
            //Trail List
            //---------------------------------------------
            List{
                Section("Trails"){
                    
                    ForEach(TrailList.trails, id: \.id){trail in
                        
                        Text("\(trail.name)")
                            .bold()
                    }
                }
            }
            
        }//End VStack
        
    }//End Body
    
}//End View

struct InsideAppView_Previews: PreviewProvider {
    static var previews: some View {
        InsideAppView()
    }
}

//---------------------------------------------
//Trail Struct
//---------------------------------------------
struct Trail: Identifiable{
    let id = UUID()
    let name: String
    
}//End Trail

//---------------------------------------------
//Trail List Struct
//---------------------------------------------
struct TrailList{
    static let trails = [
        
        Trail(
            name: "Highline Trail"
        ),
        
        Trail(
            name: "Grinnell Glacier Trail"
        ),
        
        Trail(
            name: "Avalanche Lake Trail"
        ),
        
        Trail(
            name: "Iceberg Lake Trail"
        )
    ]//End List
    
}//End TrailList
