//
//  MapView.swift
//  iFlood
//
//  Created by Spencer Sisters on 8/30/21.
//

import MapKit
import CoreLocation
import SwiftUI

struct Place: Identifiable
{
    var id = UUID()
    let name: String
    let latitude: Double
    let longitude: Double
    let type: String
    var coordinate: CLLocationCoordinate2D
    {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}

struct MapView: View
{
    let places = [
        Place(name: "Deal Island,VA", latitude: 38.14841981, longitude: -75.95974833, type: "data"),
        Place(name: "Croatan,VA Beach", latitude: 36.817589, longitude: -75.96567401, type:"data"),
        Place(name: "Potomac Science Center,VA", latitude: 38.65984844, longitude: -77.23243127, type:"data"),
        Place(name: "National Harbour,MD", latitude: 38.78995789, longitude: -77.01942954, type:"data"),
        Place(name: "Magothy Bay,VA", latitude: 37.14935667, longitude: -75.93470159, type:"data"),
        Place(name: "Eastern Shore,VA", latitude: 37.11441337, longitude: -75.96305337, type:"data"),
        Place(name: "Monie Bay,VA", latitude: 38.22467375, longitude: -75.83940896, type:"data"),
        Place(name: "Cape Henry,VA", latitude: 36.915, longitude: -75.72, type:"water"),
        Place(name: "Wallops island,VA", latitude: 37.757, longitude: -75.334, type:"water"),
        Place(name: "Dalware Bay", latitude: 38.461, longitude: -74.703, type:"water"),
        Place(name: "VA Beach Eastern Shore", latitude: 36.611, longitude: -74.843, type:"water"),
        Place(name: "Duck FRP,NC", latitude: 36.26, longitude: -75.594, type:"water"),
        Place(name: "First Landing,VA", latitude: 36.998, longitude: -76.087, type:"water"),
        Place(name: "Thimble Shoal,VA", latitude: 37.026, longitude: -76.151, type:"water"),
        Place(name: "York Spit,Va", latitude: 37.201, longitude: -76.266, type:"water"),
        Place(name: "Stingray Point,VA", latitude: 37.567, longitude: -76.257, type:"water"),
        Place(name: "Potomac,MD", latitude: 38.033, longitude: -76.335, type:"water"),
        Place(name: "Gooses Reef, MD", latitude: 38.556, longitude: -76.415, type:"water"),
        Place(name: "Susquehanna, MD", latitude: 39.54, longitude: -76.074, type:"water"),
        Place(name: "Patapsco, MD", latitude: 39.152, longitude: -76.391, type:"water"),
        Place(name: "Jamestown, VA", latitude: 37.211, longitude: -76.787, type:"water"),
        Place(name: "Lewisetta, VA", latitude: 37.99315172, longitude: -76.46280597, type: "station"),
        Place(name: "Dahlgren, VA", latitude: 38.32, longitude: -77.03667, type: "station"),
        Place(name: "Yorktown USCG Training Center, VA", latitude: 37.22667, longitude: -76.47833, type: "station"),
        Place(name: "Bishops Head, MD", latitude: 38.21663931, longitude: -76.03618314, type: "station"),
        Place(name: "Baltimore, MD", latitude: 39.26610102, longitude: -76.57757239, type: "station"),
        Place(name: "Annapolis, MD", latitude: 38.98688586, longitude: -76.47987645, type: "station"),
        Place(name: "Solomons Island, MD", latitude: 38.31574831, longitude: -76.44992133, type: "station"),
        Place(name: "Washington,DC", latitude: 38.85740644, longitude: -77.01952715, type: "station"),
        Place(name: "Wachapreague, VA", latitude: 37.62042779, longitude: -75.66673728, type: "station"),
        Place(name: "Kiptopeke, VA", latitude: 37.16343353, longitude: -75.99539591, type: "station"),
        Place(name: "Windmill Point, VA", latitude: 37.60796934, longitude: -76.28636827, type: "station"),
        Place(name: "Sewells Point, VA", latitude: 36.95016553, longitude: -76.33547653, type: "station"),
        Place(name: "Chesapeake Bay Bridge Tunnel", latitude: 36.96454151, longitude: -76.12306655, type: "station"),
        Place(name: "Tolchester Beach, MD", latitude: 39.21628252, longitude: -76.25520895, type: "station"),
        Place(name: "Cheseapeake Bay near YorkTown", latitude: 37.226667, longitude: -76.478333, type: "station"),
        Place(name: "Old Town Alexandria,VA", latitude: 38.80968632, longitude: -77.03553053, type: "station"),
        Place(name: "St. George Creek", latitude: 38.138333, longitude: -76.5, type: "station"),
        Place(name: "Chesapeake Bay at Cambridge", latitude: 38.573333, longitude: -76.068333, type: "station"),
        Place(name: "Chesapeake Bay at Havre De Grace", latitude: 39.537778, longitude: -76.089722, type: "station"),
        Place(name: "little annemix river", latitude: 37.9783, longitude: -75.8636, type: "station"),
        Place(name: "Chincoteague channel near Chincoteague bay inlet", latitude: 37.9023, longitude: -75.4078, type: "station"),
        Place(name: "Nassawadox creek near Bayford,VA", latitude: 37.476389, longitude: -75.935278, type: "station"),
        Place(name: "Oyster,VA", latitude: 37.288969, longitude: -75.923546, type: "station"),
        Place(name: "Chesapeake Bay near Mobjack Bay", latitude: 37.323611, longitude: -76.4275, type: "station"),
        Place(name: "James River at Fort Monroe,VA", latitude: 37.001944, longitude: -76.315, type: "station"),
        Place(name: "James River at Scotland Ferry,VA", latitude: 37.220139, longitude: -76.791453, type: "station"),
        Place(name: "Coastal Eastern at Duck,NC", latitude: 36.183333, longitude: -75.75, type: "station"),
        Place(name: "Atlantic Coast near Ocean City,NJ", latitude: 38.328333, longitude: -75.091667, type: "station"),
        Place(name: "Oregon Inlet Marina, NC", latitude: 35.795, longitude: -75.54833, type: "station"),
        Place(name: "USCG Station Hatteras, NC", latitude: 35.20833, longitude: -75.70333000000001, type: "station"),
        Place(name: "Beaufort, Duke Marine Lab, NC", latitude: 34.72, longitude: -76.67, type: "station"),
        Place(name: "Wrightsville Beach, NC", latitude: 34.21333, longitude: -77.78, type: "station"),
        Place(name: "Springmaid Pier, SC", latitude: 33.655, longitude: -78.91833, type: "station"),
        Place(name: "Fort Pulaski, GA", latitude: 32.03667, longitude: -80.90167, type: "station"),
        Place(name: "Mayport (Bar Pilots Dock), FL", latitude: 30.398329999999998, longitude: -81.42833, type: "station"),
        Place(name: "Trident Pier, FL", latitude: 28.415, longitude: -80.59333000000001, type: "station"),
        Place(name: "Lake Worth Pier, Atlantic Ocean, FL", latitude: 26.613329999999998, longitude: -80.035, type: "station"),
        Place(name: "Port Fourchon, LA", latitude: 29.113, longitude: -90.19833, type: "station"),
        Place(name: "Pilots Station East, LA", latitude: 28.9316667, longitude: -89.40667, type: "station"),
        Place(name: "Grand Isle, LA", latitude: 29.26333, longitude: -89.95667, type: "station"),
        Place(name: "Pilottown, LA", latitude: 29.178333, longitude: -89.2583, type: "station"),
        Place(name: "Eugene Island, LA", latitude: 29.3666667, longitude: -91.38333, type: "station"),
        Place(name: "Freshwater Canal Locks, LA", latitude: 29.5516667, longitude: -92.305, type: "station"),
        Place(name: "Shell Beach, LA", latitude: 29.86833, longitude: -89.673333, type: "station"),
        Place(name: "Shell Beach, LA", latitude: 26.7236, longitude: -97.4341, type: "station"),
        Place(name: "Baffin Bay, TX", latitude: 27.297, longitude: -97.405, type: "station"),
        Place(name: "Aransas Wildlife Refuge (TCOON), TX", latitude: 28.2216, longitude: -96.7894, type: "station"),
        Place(name: "Sargent, TX", latitude: 28.76575, longitude: -95.61128, type: "station"),
        Place(name: "Freeport, TX", latitude: 28.94, longitude: -95.30166667, type: "station"),
        Place(name: "San Luis Pass, TX", latitude: 29.08348, longitude: -95.12927, type: "station"),
        Place(name: "Eagle Point, Galveston Bay, TX", latitude: 29.35811, longitude: -94.72327, type: "station"),
        Place(name: "Rollover Pass, TX", latitude: 29.515, longitude: -94.51, type: "station"),
        Place(name: "Texas Point (Sabine Pass), TX", latitude: 29.68849, longitude: -93.83642, type: "station"),
        Place(name: "Vaca Key (Florida Bay), FL", latitude: 24.6817, longitude: -81.1075, type: "station"),
        Place(name: "Key West, FL", latitude: 24.53792, longitude: -81.81235, type: "station"),
        Place(name: "Naples (Gulf of Mexico), FL", latitude: 26.126159, longitude: -81.817154, type: "station"),
        Place(name: "Port Manatee, FL", latitude: 27.64842, longitude: -82.56723, type: "station"),
        Place(name: "Clearwater Beach, FL", latitude: 27.97774, longitude: -82.84025, type: "station"),
        Place(name: "Virginia Key (Biscayne Bay), FL", latitude: 25.72183, longitude: -80.16237, type: "station"),
        Place(name: "Cedar Key, FL", latitude: 29.13328, longitude: -83.0156, type: "station"),
        Place(name: "San Juan, La Puntilla, San Juan Bay, PR", latitude: 18.46, longitude: -66.117, type: "station"),
        Place(name: "Arecibo, PR", latitude: 18.48, longitude: -66.702, type: "station"),
        Place(name: "Mayaguez, PR", latitude: 18.218, longitude: -67.162, type: "station"),
        Place(name: "Yabucoa Harbor, PR", latitude: 18.055, longitude: -65.833, type: "station"),
        Place(name: "Charlotte Amalie, VI", latitude: 18.347, longitude: -64.925, type: "station"),
        Place(name: "Lime Tree Bay, VI", latitude: 17.695, longitude: -64.753, type: "station"),
        Place(name: "Barbuda, Antigua and Barbuda", latitude: 17.592, longitude: -61.82, type: "station"),
        Place(name: "Sandy Hook, NJ", latitude: 40.467, longitude: -74.01, type: "station"),
        Place(name: "Panama City, FL", latitude: 30.152, longitude: -85.7, type: "station"),
        Place(name: "Mona Island, PR", latitude: 18.09, longitude: -67.938, type: "station"),
        Place(name: "Magueyes Island, PR", latitude: 17.97, longitude: -67.047, type: "station"),
        Place(name: "Esperanza, Vieques Island, PR", latitude: 18.093, longitude: -65.472, type: "station"),
        Place(name: "Isabel Segunda, Vieques Island, PR", latitude: 18.152, longitude: -65.443, type: "station"),
        Place(name: "Culebra, PR", latitude: 18.302, longitude: -65.302, type: "station"),
        Place(name: "Lameshur Bay, St John, VI", latitude: 18.318, longitude: -64.725, type: "station"),
        Place(name: "Christiansted Harbor, St Croix, VI", latitude: 17.75, longitude: -64.705, type: "station"),
        Place(name: "Apalachicola, FL", latitude: 29.725, longitude: -84.98, type: "station"),
        Place(name: "Panama City Beach, FL", latitude: 30.213, longitude: -85.878, type: "station"),
        Place(name: "Pensacola, FL", latitude: 30.403, longitude: -87.212, type: "station"),
        Place(name: "Montauk, NY", latitude: 41.048, longitude: -71.96, type: "station"),
        Place(name: "Nantucket Island, MA", latitude: 41.285, longitude: -70.097, type: "station")
    
    ]
    @StateObject var viewModel = MapViewModel()

    var body: some View
    {
        ZStack{
            Map(coordinateRegion: $viewModel.region, showsUserLocation: true, annotationItems: places)
            {
                place in MapAnnotation(coordinate: place.coordinate, anchorPoint: CGPoint(x: 0.5, y: 0.5))
                {
                    Button(action:
                    {
                        print("test test")
                        //has no action, was going to display data but project ran out of time to display the data. refer to "data" page for more infromation
                    })
                    {
                        if place.type == "data"
                        {//determines the probe type
                            Image("darkgreen")//blue = 0.05, darkgreen = 0.035
                                .scaleEffect(0.03)
                        }
                        else if place.type == "water"{
                            Image("blue")
                                .scaleEffect(0.025)
                        }
                        else{
                            Image("green marker")
                                .scaleEffect(0.5)
                        }
                    }
                }
            }
            .ignoresSafeArea(.all)
            .onAppear{viewModel.checkIfLocationsOn()}
        }
    }
}

struct MapView_Previews: PreviewProvider
{
    static var previews: some View
    {
        MapView()
    }
}

final class MapViewModel: NSObject, ObservableObject, CLLocationManagerDelegate{
    
    //establishes the centered region
    @Published var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 38.9072, longitude: -76.8),
        span: MKCoordinateSpan(latitudeDelta: 1.2, longitudeDelta: 1.2))
    
    var locationManager: CLLocationManager?
    
    func checkIfLocationsOn(){
        if CLLocationManager.locationServicesEnabled(){
            locationManager = CLLocationManager()
            locationManager!.delegate = self
        }
        else{
            print("Please turn location on")
        }
    }
    
    private func checkLocationAuthorization(){
        guard let locationManager = locationManager else{ return }
        
        switch locationManager.authorizationStatus{
        case.notDetermined:
            //ask for permission
            locationManager.requestWhenInUseAuthorization()
        case.restricted:
            print("Location not enabled due to restriction")
        case.denied:
            print("You have denied location permission. Please go to setting to allow location permission")
        case.authorizedAlways, .authorizedWhenInUse:
            region = MKCoordinateRegion(center: locationManager.location!.coordinate, span: MKCoordinateSpan(latitudeDelta: 1.2, longitudeDelta: 1.2))
        @unknown default:
            break
        }
        
        func locationManagerDidChangeAuthorization(_ manager: CLLocationManager){//delegate method
            checkLocationAuthorization()
        }
    }
}
