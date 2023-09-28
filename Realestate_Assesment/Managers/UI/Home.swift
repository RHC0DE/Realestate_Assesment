//
//  Realestate_Assesment
//

import SwiftUI

struct Home: View {

    @EnvironmentObject var viewModel: RealestateViewModel
    @ObservedObject var locationManager = LocationManager()

    var body: some View {

        NavigationView {

            VStack {
                if viewModel.searchQuery.isEmpty {
                    List(self.viewModel.realestates) { realestate in
                        Section {
                            NavigationLink(destination: RealestateDetail(realestate: realestate)) {
                                RealestateCell(realestate: realestate)
                            }
                        }.foregroundColor(.clear)
                    }
                    .listStyle(.insetGrouped)
                } else {
                    if viewModel.filteredRealestates.isEmpty {
                        NoResultImage()
                    } else {
                        List(self.viewModel.filteredRealestates) { realestate in
                            Section {
                                NavigationLink(destination: RealestateDetail(realestate: realestate)) {
                                    RealestateCell(realestate: realestate)
                                }
                            }.foregroundColor(.clear)
                        }
                        .listStyle(.insetGrouped)
                    }
                }
            }
            .vAlign(.top)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .navigationBarTitle(Text(Strings.realestateTitle), displayMode: .automatic)
            .navigationBarBackButtonHidden(true)
            .onAppear() {
                self.viewModel.fetchAllRealestates()
            }
            .onAppear(perform: locationManager.requestLocation)
            .searchable(text: self.$viewModel.searchQuery) {
                ForEach(viewModel.filteredRealestates) { realestateSearch in
                    NavigationLink(destination: RealestateDetail(realestate: realestateSearch)) {
                        RealestateCell(realestate: realestateSearch)
                    }
                }
            }

        }

    }

}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(RealestateViewModel())
    }
}
