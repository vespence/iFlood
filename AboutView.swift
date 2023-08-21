//
//  AboutView.swift
//  iFlood
//
//  Created by Spencer Sisters on 8/30/21.
//

import SwiftUI

struct AboutView: View {
    var body: some View {
        ZStack{
                Color(red:0.8, green: 0.8, blue: 0.82)
                //.frame(width: 400, height: 800)
                    .ignoresSafeArea()
            ScrollView(.vertical) {
                VStack{
                    Text("About iFLOOD")
                        // .padding()
                        .multilineTextAlignment(.center)
                        .font(.title)
                        .foregroundColor(Color(red:0.039, green: 0.33, blue: 0.15))
                    Text("Integrated Flood Forecasting Systems: Developing the next generation of total water flood forecasts")
                        .padding()
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color(red:0.039, green: 0.33, blue: 0.15))
                    Text("iFLOOD is a scientific experiment and educational tool to incorporate multi-scale and multi-temporal physical process for integrated total water predictions, including large scale oceanic process, estuarine hydrodynamics, riverine flows, urban runoff, and nearshore waves. It provides real time and future flooding forecasts based on a multi-model framework for the Chesapeake Bay and the National Capital Region. ")
                        .padding()
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color(red:0.039, green: 0.33, blue: 0.15))
                    Image("logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300, height:300)
                }
                /*
                VStack{
                    Divider()
                        .background(Color.black)
                    Text("Accuracy (%)")
                        .padding()
                        .font(.title)
                    VStack{
                        Text("iFLOOD")
                        Text("87.4")
                            .font(.largeTitle)
                        Text(" ")
                    }
                    VStack{
                        Text("ETSS")
                        Text("90.4")
                            .font(.largeTitle)
                        Text("  ")
                    }
                    VStack{
                        Text("CBOFS")
                        Text("87.4")
                            .font(.largeTitle)
                        Text("  ")
                    }
                    VStack{
                        Text("ESTOFS")
                    }
                    Divider()
                        .background(Color.black)
                }
 */
        }
        }
        //.frame(height:700)
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
