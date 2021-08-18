//
//  CarouselView.swift
//  Rick&Morty
//
//  Created by dasha on 28.05.2021.
//

import SwiftUI

//MARK: - ViewModel

final class CarouselBlockViewModel: ObservableObject {
    @Published var persons: [Person] = []
    @Published var scrolled = 0
    @Published var isLoading = false
    
    func getPersons() {
        isLoading = true
        DataFetcherServices().fetchRandomPersons { [self] result in
            DispatchQueue.main.async {
                isLoading = false
                guard let personArray = result else {return}
                persons = personArray
                print("🐠🐠🐠", result)
            }
        }
    }
}

//MARK: - View

struct CarouselBlockView: View {
    @StateObject var viewModel: CarouselBlockViewModel
    
    var body: some View {
        ZStack {
            ForEach(viewModel.persons.reversed()) { person in 
                HStack {
                    CarouselContentView(viewModel: CarouselContentViewModel(), person: person, scrolled: viewModel.scrolled)
                }
                .contentShape(Rectangle())
                
                //MARK: Gesture
                .offset(x: person.offset)
                .gesture(DragGesture().onChanged({ (value) in
                    withAnimation {
                        //отключение перетягивания для последней карты
                        if value.translation.width < 0 && person.index != viewModel.persons.last!.index {
                            viewModel.persons[person.index].offset = value.translation.width
                        } else {
                            if person.index > 0 {
                                viewModel.persons[person.index - 1].offset = -(SizeGenerator.calculateWidth() + 60) + value.translation.width
                            }
                        }
                    }
                }).onEnded({ (value) in
                    
                    withAnimation {
                        if value.translation.width < 0 {
                            //движение карт
                            if -value.translation.width > 180 && person.index != viewModel.persons.last!.index {
                                viewModel.persons[person.index].offset = -(SizeGenerator.calculateWidth() + 60)
                                viewModel.scrolled += 1
                            } else {
                                viewModel.persons[person.index].offset = 0
                            }
                            
                        } else {
                            //возврат карточки
                            if person.index > 0 {
                                if value.translation.width > 180 {
                                    viewModel.persons[person.index - 1].offset = 0
                                    viewModel.scrolled -= 1
                                } else {
                                    viewModel.persons[person.index - 1].offset = -(SizeGenerator.calculateWidth() + 60)
                                }
                            }
                        }
                    }
                }))
            }
        }
        .frame(height: SizeGenerator.height)
        .padding(.horizontal, 25)
        .padding(.top, 25)
        .onAppear() { viewModel.getPersons() }
        if viewModel.isLoading { LoadingView() }
    }
}

struct CarouselBlock_Previews: PreviewProvider {
    static var previews: some View {
        TabBarRouterView(viewRouter: Router())
    }
}
