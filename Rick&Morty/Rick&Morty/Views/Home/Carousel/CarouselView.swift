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
            }
        }
    }
    
    func deletePersons() {
        persons.removeAll()
    }
}

//MARK: - View

struct CarouselBlockView: View {
    @StateObject var viewModel: CarouselBlockViewModel
    
    var body: some View {
        ZStack {
            ForEach(viewModel.persons.reversed()) { person in //persons.indices.reversed()
                HStack {
                    CarouselContentView(viewModel: CarouselViewModel(person: person, scrolled: viewModel.scrolled))
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
<<<<<<< HEAD
                                viewModel.persons[person.index - 1].offset = -(SizeGenerator.calculateWidth() + 60) + value.translation.width
=======
                                persons[person.index - 1].offset = -(calculateWidth() + 60) + value.translation.width
>>>>>>> parent of fa54670 (Refactored the NetworkService)
                            }
                        }
                        
                    }
                }).onEnded({ (value) in
                    
                    withAnimation {
                        if value.translation.width < 0 {
                            //движение карт
<<<<<<< HEAD
                            if -value.translation.width > 180 && person.index != viewModel.persons.last!.index {
                                viewModel.persons[person.index].offset = -(SizeGenerator.calculateWidth() + 60)
                                viewModel.scrolled += 1
=======
                            if -value.translation.width > 180 && person.index != persons.last!.index {
                                persons[person.index].offset = -(calculateWidth() + 60)
                                scrolled += 1
>>>>>>> parent of fa54670 (Refactored the NetworkService)
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
<<<<<<< HEAD
                                    viewModel.persons[person.index - 1].offset = -(SizeGenerator.calculateWidth() + 60)
=======
                                    persons[person.index - 1].offset = -(calculateWidth() + 60)
>>>>>>> parent of fa54670 (Refactored the NetworkService)
                                }
                            }
                        }
                    }
                }))
            }
        }
        .frame(height: height)
        .padding(.horizontal, 25)
        .padding(.top, 25)
<<<<<<< HEAD
        .onAppear() { viewModel.getPersons() }
        .onDisappear() { viewModel.deletePersons() }
        if viewModel.isLoading { LoadingView() }
=======
        .onAppear() {
            DataFetcherServices.fetchRandomPersons { personArray in
                guard let persons = personArray else {return}
                self.persons = persons
                print("🦖🦖🦖", persons)
            }
        }
>>>>>>> parent of fa54670 (Refactored the NetworkService)
    }
}


func calculateWidth() -> CGFloat {
    let screen = UIScreen.main.bounds.width - 50 // 50 hor padding
    return screen - (2 * 30)
}
var height = UIScreen.main.bounds.height / 1.8


struct CarouselBlock_Previews: PreviewProvider {
    static var previews: some View {
        TabBarRouterView(viewRouter: Router())
    }
}
