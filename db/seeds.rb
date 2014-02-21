Deck.create(name: "Roman Numerals")

Card.create(deck_id: 1, question: "I", answer: "1" )
Card.create(deck_id: 1, question: "II", answer: "2" )
Card.create(deck_id: 1, question: "III", answer: "3" )
Card.create(deck_id: 1, question: "IV", answer: "4" )
Card.create(deck_id: 1, question: "V", answer: "5" )
Card.create(deck_id: 1, question: "VI", answer: "6" )
Card.create(deck_id: 1, question: "VII", answer: "7" )
Card.create(deck_id: 1, question: "VIII", answer: "8" )
Card.create(deck_id: 1, question: "VIX", answer: "9" )
Card.create(deck_id: 1, question: "X", answer: "10" )
Card.create(deck_id: 1, question: "XI", answer: "11" )
Card.create(deck_id: 1, question: "XVI", answer: "16" )
Card.create(deck_id: 1, question: "XVIII", answer: "18" )
Card.create(deck_id: 1, question: "LXI", answer: "61" )
Card.create(deck_id: 1, question: "LXX", answer: "70" )
Card.create(deck_id: 1, question: "C", answer: "100" )

Deck.create(name: "State Capitals")

Card.create(deck_id: 2, question: "Illinois", answer: "Springfield" )
Card.create(deck_id: 2, question: "Missouri", answer: "Jefferson City" )
Card.create(deck_id: 2, question: "Indiana", answer: "Indianapolis" )
Card.create(deck_id: 2, question: "Ohio", answer: "Columbus" )
Card.create(deck_id: 2, question: "Rhode Island", answer: "Providence" )
Card.create(deck_id: 2, question: "New York", answer: "Albany" )
Card.create(deck_id: 2, question: "New Jersey", answer: "Ternton" )
Card.create(deck_id: 2, question: "North Carolina", answer: "Raleigh" )
Card.create(deck_id: 2, question: "South Carolina", answer: "Columbia" )
Card.create(deck_id: 2, question: "California", answer: "Sacramento" )
Card.create(deck_id: 2, question: "Nevada", answer: "Reno" )
Card.create(deck_id: 2, question: "Utah", answer: "Salt Lake City" )
Card.create(deck_id: 2, question: "Idaho", answer: "Boise" )
Card.create(deck_id: 2, question: "Montana", answer: "Helena" )
Card.create(deck_id: 2, question: "Wyoming", answer: "Cheyenne" )
Card.create(deck_id: 2, question: "Colorado", answer: "Denver" )
Card.create(deck_id: 2, question: "New Mexico", answer: "Santa Fe" )
Card.create(deck_id: 2, question: "Alabama", answer: "Montgomery" )
Card.create(deck_id: 2, question: "Mississippi", answer: "Jackson" )
Card.create(deck_id: 2, question: "Florida", answer: "Tallahassee" )
Card.create(deck_id: 2, question: "Georgia", answer: "Atlanta" )
Card.create(deck_id: 2, question: "Louisianna", answer: "Baton Rouge" )
Card.create(deck_id: 2, question: "Texas", answer: "Austin" )
Card.create(deck_id: 2, question: "Wisconsin", answer: "Madison" )
Card.create(deck_id: 2, question: "Minnesota", answer: "St. Paul" )
Card.create(deck_id: 2, question: "Michigan", answer: "Lansing" )
Card.create(deck_id: 2, question: "Maine", answer: "Augusta" )
Card.create(deck_id: 2, question: "Oregon", answer: "Salem" )
Card.create(deck_id: 2, question: "Washington", answer: "Olympia" )
Card.create(deck_id: 2, question: "Kansas", answer: "Topeka" )
Card.create(deck_id: 2, question: "Nebraska", answer: "Lincoln" )
Card.create(deck_id: 2, question: "South Dakota", answer: "Pierre" )
Card.create(deck_id: 2, question: "North Dakota", answer: "Bismarck" )
Card.create(deck_id: 2, question: "Minnesota", answer: "St. Paul" )
Card.create(deck_id: 2, question: "Vermont", answer: "Montpelier" )
Card.create(deck_id: 2, question: "New Hampshire", answer: "Concord" )
Card.create(deck_id: 2, question: "Connecticut", answer: "Hartford" )
Card.create(deck_id: 2, question: "Virginia", answer: "Richmond" )
Card.create(deck_id: 2, question: "Kentucky", answer: "Frankfurt" )
Card.create(deck_id: 2, question: "Tennessee", answer: "Nashville" )
Card.create(deck_id: 2, question: "Arkansas", answer: "Little Rock" )
Card.create(deck_id: 2, question: "Alaska", answer: "Juneau" )
Card.create(deck_id: 2, question: "Hawaii", answer: "Honolulu" )
Card.create(deck_id: 2, question: "Maryland", answer: "Annapolis" )
Card.create(deck_id: 2, question: "Deleware", answer: "Dover" )
Card.create(deck_id: 2, question: "Oklahoma ", answer: "Oklahoma City" )
Card.create(deck_id: 2, question: "Pennsylvania", answer: "Harrisburg" )
Card.create(deck_id: 2, question: "Arizona", answer: "Phoenix" )
Card.create(deck_id: 2, question: "Massachusetts", answer: "Boston" )
Card.create(deck_id: 2, question: "Iowa", answer: "Des Moines" )

Deck.create(name: "Presidents")

Card.create(deck_id: 3, question: "First President", answer: "George Washington" )
Card.create(deck_id: 3, question: "Civil War President", answer: "Abraham Lincoln" )
Card.create(deck_id: 3, question: "First President to Die in Office", answer: "William Henry Harrison" )
Card.create(deck_id: 3, question: "WWI President", answer: "Woodrow Wilson" )
Card.create(deck_id: 3, question: "Elected to Four Terms", answer: "Franklin Roosevelt" )
Card.create(deck_id: 3, question: "President who Resigned", answer: "Richard Nixon" )
Card.create(deck_id: 3, question: "President who was never elected as Pres or VP", answer: "Gerald Ford" )
Card.create(deck_id: 3, question: "President Elected to two terms not in a row", answer: "Grover Clevland" )

require 'digest'
#dont use faker here because of the
#encryption we can't tell what it will be if its random
User.create(username: "Person0", password: User.encrypt("1234"))
User.create(username: "Person1", password: User.encrypt("aabbcc"))
User.create(username: "Person2", password: User.encrypt("qwerty"))
User.create(username: "Person3", password: User.encrypt("tthhcc"))
User.create(username: "Person4", password: User.encrypt("wiperblade"))
User.create(username: "Person5", password: User.encrypt("football"))
User.create(username: "Person6", password: User.encrypt("twilight"))
