//
//  CarouselView.swift
//  Rick&Morty
//
//  Created by dasha on 28.05.2021.
//

import SwiftUI

struct CarouselBlock: View {
    @State var persons: [Person] = []
    @State private var scrolled = 0
    
    @EnvironmentObject var viewModel: CarouselViewModel
    
    var body: some View {
        ZStack {
            ForEach(persons.reversed()) { person in //persons.indices.reversed()
                HStack {
                    CarouselContentView(person: person, scrolled: scrolled)
                }
                .contentShape(Rectangle())
                
                //MARK: Gesture
                .offset(x: person.offset)
                .gesture(DragGesture().onChanged({ (value) in
                    withAnimation {
                        //отключение перетягивания для последней карты
                        if value.translation.width < 0 && person.index != persons.last!.index {
                            persons[person.index].offset = value.translation.width
                        } else {
                            if person.index > 0 {
                                persons[person.index - 1].offset = -(calculateWidth() + 60) + value.translation.width
                            }
                        }
                        
                    }
                }).onEnded({ (value) in
                    
                    withAnimation {
                        if value.translation.width < 0 {
                            //движение карт
                            if -value.translation.width > 180 && person.index != persons.last!.index {
                                persons[person.index].offset = -(calculateWidth() + 60)
                                scrolled += 1
                            } else {
                                persons[person.index].offset = 0
                            }
                            
                        } else {
                            //возврат карточки
                            if person.index > 0 {
                                if value.translation.width > 180 {
                                    persons[person.index - 1].offset = 0
                                    scrolled -= 1
                                } else {
                                    persons[person.index - 1].offset = -(calculateWidth() + 60)
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
        .onAppear() {
            DataFetcherServices.fetchRandomPersons { personArray in
                guard let persons = personArray else {return}
                self.persons = persons
                print("🦖🦖🦖", persons)
            }
        }
    }
    
}


func calculateWidth() -> CGFloat {
    let screen = UIScreen.main.bounds.width - 50 // 50 hor padding
    return screen - (2 * 30)
}
var height = UIScreen.main.bounds.height / 1.8
