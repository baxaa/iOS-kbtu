//
//  DataSource.swift
//  assignment9
//
//  Created by Baqbergen Onalbekov on 17.11.2024.
//

import Foundation

struct Item {
    let id: Int
    let title: String
    let subtitle: String
    let description: String
    let releaseDate: String
    let imageName: String
    let category: Category
}

enum Category {
    case books
    case music
    case movies
}

class DataProvider {
    static let shared = DataProvider()
    private init() {}
    
    let items: [Item] = [
        // Книги
        Item(id: 1, title: "1984", subtitle: "Джордж Оруэлл", description: "Дистопия о тоталитарном обществе", releaseDate: "1949", imageName: "1984", category: .books),
        Item(id: 2, title: "Мастер и Маргарита", subtitle: "Михаил Булгаков", description: "Роман о добре и зле", releaseDate: "1967", imageName: "1984", category: .books),
        Item(id: 3, title: "Убийство в «Восточном экспрессе»", subtitle: "Агата Кристи", description: "Классический детектив с Эркюлем Пуаро", releaseDate: "1934", imageName: "1984", category: .books),
        Item(id: 4, title: "Гарри Поттер и философский камень", subtitle: "Дж. К. Роулинг", description: "Начало волшебной истории о Гарри Поттере", releaseDate: "1997", imageName: "1984", category: .books),
        Item(id: 5, title: "Анна Каренина", subtitle: "Лев Толстой", description: "Роман о трагической любви", releaseDate: "1877", imageName: "1984", category: .books),
        Item(id: 6, title: "Портрет Дориана Грея", subtitle: "Оскар Уайльд", description: "Роман о грехе и искуплении", releaseDate: "1890", imageName: "1984", category: .books),
        Item(id: 7, title: "Сто лет одиночества", subtitle: "Габриэль Гарсия Маркес", description: "Магический реализм в лучшем виде", releaseDate: "1967", imageName: "1984", category: .books),
        Item(id: 8, title: "Война и мир", subtitle: "Лев Толстой", description: "Эпический роман о войне и мире", releaseDate: "1869", imageName: "1984", category: .books),
        Item(id: 9, title: "Над пропастью во ржи", subtitle: "Дж. Д. Сэлинджер", description: "История взросления и бунта", releaseDate: "1951", imageName: "1984", category: .books),
        Item(id: 10, title: "Ловец снов", subtitle: "Стивен Кинг", description: "Мистический триллер", releaseDate: "2001", imageName: "1984", category: .books),

        // Музыка
        Item(id: 11, title: "Bohemian Rhapsody", subtitle: "Queen", description: "Культовая рок-песня", releaseDate: "1975", imageName: "image", category: .music),
        Item(id: 12, title: "Thriller", subtitle: "Michael Jackson", description: "Самый продаваемый альбом", releaseDate: "1982", imageName: "image", category: .music),
        Item(id: 13, title: "Imagine", subtitle: "John Lennon", description: "Гимн мира и любви", releaseDate: "1971", imageName: "image", category: .music),
        Item(id: 14, title: "Like a Rolling Stone", subtitle: "Bob Dylan", description: "Рок-гимн эпохи", releaseDate: "1965", imageName: "image", category: .music),
        Item(id: 15, title: "Hotel California", subtitle: "Eagles", description: "Легендарная песня 70-х", releaseDate: "1977", imageName: "image", category: .music),
        Item(id: 16, title: "Smells Like Teen Spirit", subtitle: "Nirvana", description: "Гимн поколения гранжа", releaseDate: "1991", imageName: "image", category: .music),
        Item(id: 17, title: "Billie Jean", subtitle: "Michael Jackson", description: "Иконическая поп-песня", releaseDate: "1982", imageName: "image", category: .music),
        Item(id: 18, title: "Stairway to Heaven", subtitle: "Led Zeppelin", description: "Классика рока", releaseDate: "1971", imageName: "image", category: .music),
        Item(id: 19, title: "Hey Jude", subtitle: "The Beatles", description: "Одна из самых популярных песен группы", releaseDate: "1968", imageName: "image", category: .music),
        Item(id: 20, title: "Superstition", subtitle: "Stevie Wonder", description: "Иконический фанк-трек", releaseDate: "1972", imageName: "image", category: .music),

        // Кино
        Item(id: 21, title: "Inception", subtitle: "Реж. Кристофер Нолан", description: "Научно-фантастический триллер", releaseDate: "2010", imageName: "image", category: .movies),
        Item(id: 22, title: "The Matrix", subtitle: "Реж. Вачовски", description: "Культовый фантастический фильм", releaseDate: "1999", imageName: "image", category: .movies),
        Item(id: 23, title: "Pulp Fiction", subtitle: "Реж. Квентин Тарантино", description: "Криминальный шедевр", releaseDate: "1994", imageName: "image", category: .movies),
        Item(id: 24, title: "The Godfather", subtitle: "Реж. Фрэнсис Форд Коппола", description: "Мафия и семья", releaseDate: "1972", imageName: "image", category: .movies),
        Item(id: 25, title: "Fight Club", subtitle: "Реж. Дэвид Финчер", description: "Фильм о бунте и личности", releaseDate: "1999", imageName: "image", category: .movies),
        Item(id: 26, title: "Forrest Gump", subtitle: "Реж. Роберт Земекис", description: "История жизни необычного человека", releaseDate: "1994", imageName: "image", category: .movies),
        Item(id: 27, title: "The Dark Knight", subtitle: "Реж. Кристофер Нолан", description: "Темный рыцарь Готэма", releaseDate: "2008", imageName: "image", category: .movies),
        Item(id: 28, title: "The Shawshank Redemption", subtitle: "Реж. Фрэнк Дарабонт", description: "История надежды и свободы", releaseDate: "1994", imageName: "image", category: .movies),
        Item(id: 29, title: "Schindler's List", subtitle: "Реж. Стивен Спилберг", description: "История спасения в годы Холокоста", releaseDate: "1993", imageName: "image", category: .movies),
        Item(id: 30, title: "Interstellar", subtitle: "Реж. Кристофер Нолан", description: "Космическая одиссея", releaseDate: "2014", imageName: "image", category: .movies)
    ]

    func getItems(for category: Category) -> [Item] {
        return items.filter { $0.category == category }
    }
}
