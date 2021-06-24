//
//  FilterMenuView.swift
//  Rick&Morty
//
//  Created by dasha on 09.06.2021.
//

import SwiftUI

//MARK: - ViewModel
final class FilterMenuViewModel: ObservableObject {
    @Published var selctedCategory: String = ""
    
    var linerGradient = LinearGradient(gradient: Gradient(colors: [Color("accentBlue"), Color("accentGreen")]), startPoint: .top, endPoint: .bottom)
    
    func filterPersons() {
        switch selctedCategory {
        
        default: break
        }
    }
}

//MARK: - View
struct FilterMenuView: View {
    @Binding var categories: [String]
    @ObservedObject var viewModel = FilterMenuViewModel()
    
    var body: some View {
        HStack(spacing: 22) {
            ForEach(categories, id: \.self) { item in
                Button {
                    viewModel.selctedCategory == item ? (viewModel.selctedCategory = "") : (viewModel.selctedCategory = item)
                } label: {
                    Image(item)
                        .resizable()
                        .frame(width: 45, height: 45)
                }
                .frame(maxWidth: .infinity)
                .frame(height: 73)
                .background(viewModel.selctedCategory == item ? AnyView(viewModel.linerGradient.opacity(0.8)) : AnyView(Color.gray.opacity(0.3)))
                .cornerRadius(8)
            }
        }
        .animation(.easeIn)
        .transition(.move(edge: .top))
        .onAppear() { viewModel.filterPersons() }
    }
}

//MARK: - Previews
struct FilterMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(viewModel: SearchViewModel())
    }
}
