//
//  DataView.swift
//  iFlood
//
//  Created by Spencer Sisters on 8/30/21.
//

import SwiftUI

let sensors = ["Deal Island, VA", "Croatan, VA Beach", "Potomac Science Center, VA", "National Harbour, MD", "Magothy Bay, VA", "Eastern Shore, VA", "Monie Bay, VA"]

struct GraphItems {
    let data: Double
}

private func getData() -> [GraphItems]
{
    var data = [GraphItems]()
    for i in [0.69, 0.70, 0.70, 0.71, 0.71, 0.71, 0.71, 0.71, 0.71, 0.71]
    {
        data.append(GraphItems(data:i*100))
    }
    return data
}

struct LineChartView: View{
    
    let name: String
    let values: [Double]
    let labels: [String]
    
    let screenWidth = UIScreen.main.bounds.width
    
    private var pathMover: Path{
        if values.isEmpty{//if passing nothing, display nothing
            return Path()
        }
        var offsetX = screenWidth/CGFloat(values.count)
        var path = Path()
        
        let y = values[0]
        var pointToMoveTo = CGPoint(x: offsetX, y: y)
        path.move(to: pointToMoveTo)
        for val in values{
            offsetX += screenWidth/CGFloat(values.count)
            pointToMoveTo = CGPoint(x: offsetX, y:val)
            path.addLine(to: pointToMoveTo)
        }
        return path
    }
    
    var body: some View {
        VStack {
                    Text("Slide this screen down to return to menu")
                        .font(.title3)
            Spacer()
            Text("Data for " + name)
                .font(.title)
                .background(Color.yellow)
                .padding()
            HStack{
                Text("Date & Time")
                    .font(.system(size:20))
                Text("Water Level")
                    .font(.system(size:20))
            }
            ScrollView(.vertical){
                HStack{
                    VStack{
                        //date and time
                        ForEach(labels, id:\.self) { label in
                            Text(label)
                        }
                    }
                    VStack{
                        //level
                        ForEach(values, id:\.self) { value in
                            Text(String(value))
                        }
                    }
                }
            }
            /*
            HStack{
                Text("vertical")
                    .rotationEffect(Angle(degrees: 270))
                VStack{
                    ForEach(labels, id:\.self) { label in
                        Text(label)
                            .frame(width: screenWidth/CGFloat(labels.count) - 10)
                            .font(.system(size:10, weight: .light))
                    }
                }
                    //.frame(height:10)
                VStack{
                    pathMover.stroke(Color.black, lineWidth: 2.0)
                        .rotationEffect(.degrees(180), anchor: .center)
                        .rotation3DEffect(.degrees(180), axis: (x: 0, y: 0.5, z: 0))
                        .frame(maxWidth: .infinity, maxHeight: 300)
                    HStack {
                        ForEach(labels, id: \.self) { label in
                            Text(label)
                                .frame(width: screenWidth/CGFloat(labels.count) - 10)
                                .font(.system(size:10, weight: .light))
                        }
                    }
                }
            }
            Spacer()
                .frame(height: 10)
            Text("time in hour:minute")
                .font(.title3)
            Spacer()
            */
        }
    }
}


struct DataView: View {
    @State private var isExpanded = false
    @State private var selectedNum = "Sensor Locations"
    @State private var showingSheet = false
    let data = getData().map {$0.data}
    let labels = ["13:06", "13:12", "13:18", "13:24", "13:30", "13:36", "13:42", "13:48", "13:54", "14:00"]
    enum sensor: CaseIterable{
        case PotomacScience, DealIsland
    }
    var body: some View {
        ZStack{
            Color(red:0.039, green: 0.35, blue: 0.15)
                .ignoresSafeArea()
            VStack(alignment: .leading, spacing:15){
                Text("Sensor Data")
                    .font(.largeTitle)
                    .foregroundColor(Color.white)
                DisclosureGroup("\(selectedNum)", isExpanded: $isExpanded){
                    ScrollView{
                        VStack{
                            ForEach(sensors, id: \.self){
                                num in Text("\(num)")
                                    .frame(maxWidth: .infinity)
                                    .font(.title3)
                                    .padding(.all)
                                    .onTapGesture{
                                        print(num)
                                        self.selectedNum = num
                                        print(num)
                                        //self.currentStation = num
                                        self.isExpanded.toggle()
                                        self.showingSheet.toggle()
                                    }
                                    .sheet(isPresented: $showingSheet){
                                        LineChartView(name:selectedNum, values: data, labels: labels)
                                }
                            }
                        }
                    }.frame(height: 150)
                }.foregroundColor(Color.black)
                    .font(.title2)
                    .padding(.all)
                    .background(Color.yellow)
                    .cornerRadius(10)
                Spacer()
            }.padding(.all)
        }
    }
}



struct DataView_Previews: PreviewProvider {
    static var previews: some View {
        DataView()
    }
}
