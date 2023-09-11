//
//  MovieListModel.swift
//  MovieApp
//
//  Created by Damir Nuriev on 18.07.2023.
//

import Foundation

struct MovieListModel: Decodable {
    let id: Int
    let title: String
    let overview: String
    let posterPath: String
    let voteAverage: Double
}

struct NowPlayingListModel: Decodable {
    
}

struct CommonListResponseModel<Model: Decodable>: Decodable {
    let page: Int
    let results: [Model]
}


/*
 {
   "page": 1,
   "results": [
     {
       "adult": false,
       "backdrop_path": "/qWQSnedj0LCUjWNp9fLcMtfgadp.jpg",
       "genre_ids": [
         28,
         12,
         878
       ],
       "id": 667538,
       "original_language": "en",
       "original_title": "Transformers: Rise of the Beasts",
       "overview": "When a new threat capable of destroying the entire planet emerges, Optimus Prime and the Autobots must team up with a powerful faction known as the Maximals. With the fate of humanity hanging in the balance, humans Noah and Elena will do whatever it takes to help the Transformers as they engage in the ultimate battle to save Earth.",
       "popularity": 11856.991,
       "poster_path": "/gPbM0MK8CP8A174rmUwGsADNYKD.jpg",
       "release_date": "2023-06-06",
       "title": "Transformers: Rise of the Beasts",
       "video": false,
       "vote_average": 7.3,
       "vote_count": 1304
     },
     {
       "adult": false,
       "backdrop_path": "/5YZbUmjbMa3ClvSW1Wj3D6XGolb.jpg",
       "genre_ids": [
         878,
         12,
         28
       ],
       "id": 447365,
       "original_language": "en",
       "original_title": "Guardians of the Galaxy Vol. 3",
       "overview": "Peter Quill, still reeling from the loss of Gamora, must rally his team around him to defend the universe along with protecting one of their own. A mission that, if not completed successfully, could quite possibly lead to the end of the Guardians as we know them.",
       "popularity": 4145.055,
       "poster_path": "/r2J02Z2OpNTctfOSN1Ydgii51I3.jpg",
       "release_date": "2023-05-03",
       "title": "Guardians of the Galaxy Vol. 3",
       "video": false,
       "vote_average": 8.1,
       "vote_count": 3154
     },
     {
       "adult": false,
       "backdrop_path": "/oqP1qEZccq5AD9TVTIaO6IGUj7o.jpg",
       "genre_ids": [
         14,
         28,
         12
       ],
       "id": 455476,
       "original_language": "en",
       "original_title": "Knights of the Zodiac",
       "overview": "When a headstrong street orphan, Seiya, in search of his abducted sister unwittingly taps into hidden powers, he discovers he might be the only person alive who can protect a reincarnated goddess, sent to watch over humanity. Can he let his past go and embrace his destiny to become a Knight of the Zodiac?",
       "popularity": 2030.307,
       "poster_path": "/tBiUXvCqz34GDeuY7jK14QQdtat.jpg",
       "release_date": "2023-04-27",
       "title": "Knights of the Zodiac",
       "video": false,
       "vote_average": 6.6,
       "vote_count": 504
     },
     {
       "adult": false,
       "backdrop_path": "/4XM8DUTQb3lhLemJC51Jx4a2EuA.jpg",
       "genre_ids": [
         28,
         80,
         53
       ],
       "id": 385687,
       "original_language": "en",
       "original_title": "Fast X",
       "overview": "Over many missions and against impossible odds, Dom Toretto and his family have outsmarted, out-nerved and outdriven every foe in their path. Now, they confront the most lethal opponent they've ever faced: A terrifying threat emerging from the shadows of the past who's fueled by blood revenge, and who is determined to shatter this family and destroy everything—and everyone—that Dom loves, forever.",
       "popularity": 2250.479,
       "poster_path": "/fiVW06jE7z9YnO4trhaMEdclSiC.jpg",
       "release_date": "2023-05-17",
       "title": "Fast X",
       "video": false,
       "vote_average": 7.4,
       "vote_count": 2737
     },
     {
       "adult": false,
       "backdrop_path": "/zcySy6dnSmyqiichtDgO7AEeZoq.jpg",
       "genre_ids": [
         28,
         18,
         53
       ],
       "id": 254128,
       "original_language": "en",
       "original_title": "San Andreas",
       "overview": "In the aftermath of a massive earthquake in California, a rescue-chopper pilot makes a dangerous journey across the state in order to rescue his estranged daughter.",
       "popularity": 1513.304,
       "poster_path": "/2Gfjn962aaFSD6eST6QU3oLDZTo.jpg",
       "release_date": "2015-05-27",
       "title": "San Andreas",
       "video": false,
       "vote_average": 6.2,
       "vote_count": 7823
     },
     {
       "adult": false,
       "backdrop_path": "/uyi0Ytkkw4pgT4GkYZHdqravjT5.jpg",
       "genre_ids": [
         28,
         18
       ],
       "id": 678512,
       "original_language": "en",
       "original_title": "Sound of Freedom",
       "overview": "The story of Tim Ballard, a former US government agent, who quits his job in order to devote his life to rescuing children from global sex traffickers.",
       "popularity": 1759.455,
       "poster_path": "/mx4O9OEvIB265VM3UATLslsSW5t.jpg",
       "release_date": "2023-07-03",
       "title": "Sound of Freedom",
       "video": false,
       "vote_average": 8.1,
       "vote_count": 102
     },
     {
       "adult": false,
       "backdrop_path": "/fjWcAbHRxCSR4kLGvsPEhNjR2ts.jpg",
       "genre_ids": [
         10749,
         28,
         35
       ],
       "id": 921636,
       "original_language": "en",
       "original_title": "The Out-Laws",
       "overview": "A straight-laced bank manager is about to marry the love of his life. When his bank is held up by infamous Ghost Bandits during his wedding week, he believes his future in-laws who just arrived in town, are the infamous Out-Laws.",
       "popularity": 1367.016,
       "poster_path": "/5dliMQ2ODbGNoq0hlefdnuXQxMw.jpg",
       "release_date": "2023-07-07",
       "title": "The Out-Laws",
       "video": false,
       "vote_average": 6.3,
       "vote_count": 232
     },
     {
       "adult": false,
       "backdrop_path": "/7I6VUdPj6tQECNHdviJkUHD2u89.jpg",
       "genre_ids": [
         28,
         53,
         80
       ],
       "id": 603692,
       "original_language": "en",
       "original_title": "John Wick: Chapter 4",
       "overview": "With the price on his head ever increasing, John Wick uncovers a path to defeating The High Table. But before he can earn his freedom, Wick must face off against a new enemy with powerful alliances across the globe and forces that turn old friends into foes.",
       "popularity": 1247.306,
       "poster_path": "/vZloFAK7NmvMGKE7VkF5UHaz0I.jpg",
       "release_date": "2023-03-22",
       "title": "John Wick: Chapter 4",
       "video": false,
       "vote_average": 7.9,
       "vote_count": 3704
     },
     {
       "adult": false,
       "backdrop_path": "/9n2tJBplPbgR2ca05hS5CKXwP2c.jpg",
       "genre_ids": [
         16,
         10751,
         12,
         14,
         35
       ],
       "id": 502356,
       "original_language": "en",
       "original_title": "The Super Mario Bros. Movie",
       "overview": "While working underground to fix a water main, Brooklyn plumbers—and brothers—Mario and Luigi are transported down a mysterious pipe and wander into a magical new world. But when the brothers are separated, Mario embarks on an epic quest to find Luigi.",
       "popularity": 1105.898,
       "poster_path": "/qNBAXBIQlnOThrVvA6mA2B5ggV6.jpg",
       "release_date": "2023-04-05",
       "title": "The Super Mario Bros. Movie",
       "video": false,
       "vote_average": 7.8,
       "vote_count": 5674
     },
     {
       "adult": false,
       "backdrop_path": "/4HodYYKEIsGOdinkGi2Ucz6X9i0.jpg",
       "genre_ids": [
         28,
         12,
         16,
         878
       ],
       "id": 569094,
       "original_language": "en",
       "original_title": "Spider-Man: Across the Spider-Verse",
       "overview": "After reuniting with Gwen Stacy, Brooklyn’s full-time, friendly neighborhood Spider-Man is catapulted across the Multiverse, where he encounters the Spider Society, a team of Spider-People charged with protecting the Multiverse’s very existence. But when the heroes clash on how to handle a new threat, Miles finds himself pitted against the other Spiders and must set out on his own to save those he loves most.",
       "popularity": 1268.396,
       "poster_path": "/8Vt6mWEReuy4Of61Lnj5Xj704m8.jpg",
       "release_date": "2023-05-31",
       "title": "Spider-Man: Across the Spider-Verse",
       "video": false,
       "vote_average": 8.5,
       "vote_count": 2311
     },
     {
       "adult": false,
       "backdrop_path": "/qe0oK0A5ovrlgH39Ga13dxxw9MU.jpg",
       "genre_ids": [
         28,
         35,
         80,
         12
       ],
       "id": 1130818,
       "original_language": "en",
       "original_title": "Sheroes",
       "overview": "When four thick-as-thieves friends arrive in Thailand, they quickly find themselves in over their heads. Fighting to stay alive, they employ their unique set of skills and unleash their fierce loyalty in a heart-pumping battle for survival.",
       "popularity": 1103.376,
       "poster_path": "/itUAkQmihFmRxMYTa3AkvIzMCV4.jpg",
       "release_date": "2023-06-23",
       "title": "Sheroes",
       "video": false,
       "vote_average": 5.9,
       "vote_count": 56
     },
     {
       "adult": false,
       "backdrop_path": "/cSYLX73WskxCgvpN3MtRkYUSj1T.jpg",
       "genre_ids": [
         16,
         35,
         10751,
         14,
         10749
       ],
       "id": 976573,
       "original_language": "en",
       "original_title": "Elemental",
       "overview": "In a city where fire, water, land and air residents live together, a fiery young woman and a go-with-the-flow guy will discover something elemental: how much they have in common.",
       "popularity": 1126.045,
       "poster_path": "/8riWcADI1ekEiBguVB9vkilhiQm.jpg",
       "release_date": "2023-06-14",
       "title": "Elemental",
       "video": false,
       "vote_average": 7.6,
       "vote_count": 499
     },
     {
       "adult": false,
       "backdrop_path": "/rPBeEi1tU8IhQ9rbdnlLU0d0NR.jpg",
       "genre_ids": [
         28,
         12,
         18
       ],
       "id": 445651,
       "original_language": "en",
       "original_title": "The Darkest Minds",
       "overview": "After a disease kills 98% of America's children, the surviving 2% develop superpowers and are placed in internment camps. A 16-year-old girl escapes her camp and joins a group of other teens on the run from the government.",
       "popularity": 1130.438,
       "poster_path": "/94RaS52zmsqaiAe1TG20pdbJCZr.jpg",
       "release_date": "2018-07-25",
       "title": "The Darkest Minds",
       "video": false,
       "vote_average": 7,
       "vote_count": 2496
     },
     {
       "adult": false,
       "backdrop_path": "/PwI3EfasE9fVuXsmMu9ffJh0Re.jpg",
       "genre_ids": [
         27,
         9648,
         53
       ],
       "id": 406563,
       "original_language": "en",
       "original_title": "Insidious: The Last Key",
       "overview": "Parapsychologist Elise Rainier and her team travel to Five Keys, NM, to investigate a man’s claim of a haunting. Terror soon strikes when Rainier realizes that the house he lives in was her family’s old home.",
       "popularity": 1032.76,
       "poster_path": "/nb9fc9INMg8kQ8L7sE7XTNsZnUX.jpg",
       "release_date": "2018-01-03",
       "title": "Insidious: The Last Key",
       "video": false,
       "vote_average": 6.3,
       "vote_count": 2536
     },
     {
       "adult": false,
       "backdrop_path": "/mV1HOCbUqx7nfFPwledYsvMYHrw.jpg",
       "genre_ids": [
         28,
         53
       ],
       "id": 47964,
       "original_language": "en",
       "original_title": "A Good Day to Die Hard",
       "overview": "Iconoclastic, take-no-prisoners cop John McClane, finds himself for the first time on foreign soil after traveling to Moscow to help his wayward son Jack - unaware that Jack is really a highly-trained CIA operative out to stop a nuclear weapons heist. With the Russian underworld in pursuit, and battling a countdown to war, the two McClanes discover that their opposing methods make them unstoppable heroes.",
       "popularity": 972.05,
       "poster_path": "/evxtv4e8Amm436Y5rW16RkGu8pX.jpg",
       "release_date": "2013-02-06",
       "title": "A Good Day to Die Hard",
       "video": false,
       "vote_average": 5.3,
       "vote_count": 5943
     },
     {
       "adult": false,
       "backdrop_path": "/llZSAx6YW0y9tV4iMKmbUBNh70I.jpg",
       "genre_ids": [
         35,
         12,
         14
       ],
       "id": 346698,
       "original_language": "en",
       "original_title": "Barbie",
       "overview": "Barbie and Ken are having the time of their lives in the colorful and seemingly perfect world of Barbie Land. However, when they get a chance to go to the real world, they soon discover the joys and perils of living among humans.",
       "popularity": 1267.687,
       "poster_path": "/cgYg04miVQUAG2FKk3amSnnHzOp.jpg",
       "release_date": "2023-07-19",
       "title": "Barbie",
       "video": false,
       "vote_average": 8.4,
       "vote_count": 52
     },
     {
       "adult": false,
       "backdrop_path": "/zxnfMi4qW0bdAtcwCogrR9dRrqd.jpg",
       "genre_ids": [
         878,
         9648,
         53
       ],
       "id": 1103825,
       "original_language": "en",
       "original_title": "War of the Worlds: The Attack",
       "overview": "Three young astronomers fight to survive a deadly Martian invasion.",
       "popularity": 859.77,
       "poster_path": "/c3CUKHtQUvPvp9NSFsKwYsPLAdW.jpg",
       "release_date": "2023-04-21",
       "title": "War of the Worlds: The Attack",
       "video": false,
       "vote_average": 6.2,
       "vote_count": 28
     },
     {
       "adult": false,
       "backdrop_path": "/yF1eOkaYvwiORauRCPWznV9xVvi.jpg",
       "genre_ids": [
         28,
         12,
         878
       ],
       "id": 298618,
       "original_language": "en",
       "original_title": "The Flash",
       "overview": "When his attempt to save his family inadvertently alters the future, Barry Allen becomes trapped in a reality in which General Zod has returned and there are no Super Heroes to turn to. In order to save the world that he is in and return to the future that he knows, Barry's only hope is to race for his life. But will making the ultimate sacrifice be enough to reset the universe?",
       "popularity": 1080.96,
       "poster_path": "/rktDFPbfHfUbArZ6OOOKsXcv0Bm.jpg",
       "release_date": "2023-06-13",
       "title": "The Flash",
       "video": false,
       "vote_average": 6.8,
       "vote_count": 913
     },
     {
       "adult": false,
       "backdrop_path": "/qi6Edc1OPcyENecGtz8TF0DUr9e.jpg",
       "genre_ids": [
         27,
         9648,
         53
       ],
       "id": 423108,
       "original_language": "en",
       "original_title": "The Conjuring: The Devil Made Me Do It",
       "overview": "Paranormal investigators Ed and Lorraine Warren encounter what would become one of the most sensational cases from their files. The fight for the soul of a young boy takes them beyond anything they'd ever seen before, to mark the first time in U.S. history that a murder suspect would claim demonic possession as a defense.",
       "popularity": 814.923,
       "poster_path": "/xbSuFiJbbBWCkyCCKIMfuDCA4yV.jpg",
       "release_date": "2021-05-25",
       "title": "The Conjuring: The Devil Made Me Do It",
       "video": false,
       "vote_average": 7.5,
       "vote_count": 5217
     },
     {
       "adult": false,
       "backdrop_path": "/upXYRYVA4Jij3whT5ilP4fTuVw0.jpg",
       "genre_ids": [
         27,
         80,
         53
       ],
       "id": 1075335,
       "original_language": "en",
       "original_title": "Little Bone Lodge",
       "overview": "During a stormy night in the Scottish Highlands, two criminal brothers on the run seek refuge in a desolate farmhouse. But after taking the resident family captive, they find the house holds even darker secrets of its own.",
       "popularity": 817.713,
       "poster_path": "/2BwerQH4tZvHU6zUlC77aDw7pLt.jpg",
       "release_date": "2023-03-11",
       "title": "Little Bone Lodge",
       "video": false,
       "vote_average": 7.7,
       "vote_count": 106
     }
   ],
   "total_pages": 39148,
   "total_results": 782943
 }
 */
