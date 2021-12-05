//
//  RickipediaWidget.swift
//  RickipediaWidget
//
//  Created by dasha on 13.09.2021.
//

import WidgetKit
import SwiftUI
import Intents

struct Provider: IntentTimelineProvider {
    
    @AppStorage("widget", store: UserDefaults(suiteName: "group.novembrz.Rick-Morty"))
    var widgetData = Data()
    
    //отображение по умолчанию
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), widjetModel: WidgetProvider.myPerson, configuration: ConfigurationIntent())
    }
    
    //некий скелетон
    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        guard let data = try? JSONDecoder().decode(WidgetModel.self, from: widgetData) else {return}//что сохранили по кнопке
        let entry = SimpleEntry(date: Date(), widjetModel: data, configuration: configuration)
        completion(entry)
    }
    
    //логика, как по времени меняемся (прим каждые 6 часов меняем)
    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

        guard let data = try? JSONDecoder().decode(WidgetModel.self, from: widgetData) else {return}//что сохранили по кнопке
        let currentDate = Date()
        
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, widjetModel: data, configuration: configuration)
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd) //когда меняем
        completion(timeline)
    }
}

//данные для отображения
struct SimpleEntry: TimelineEntry {
    let date: Date
    let widjetModel: WidgetModel
    let configuration: ConfigurationIntent
}

//вью
struct RickipediaWidgetEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        WidgetView(person: entry.widjetModel)
    }
}

@main //точка зарпуска кода, все что выше не запускается тк сборка здесь
struct RickipediaWidget: Widget {
    let kind: String = "RickipediaWidget" //id widget

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
            RickipediaWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
        .supportedFamilies([.systemSmall, .systemMedium, .systemLarge])
    }
}

struct RickipediaWidget_Previews: PreviewProvider {
    static var previews: some View {
        RickipediaWidgetEntryView(entry: SimpleEntry(date: Date(), widjetModel: WidgetProvider.myPerson, configuration: ConfigurationIntent()))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
