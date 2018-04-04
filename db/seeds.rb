# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ActiveRecord::Base.connection.execute("TRUNCATE celebrities")

Celebrity.create(age: 36, name: 'Delia Matache', male: 0, real_person: 1, dead: 0, domain: 'singer', nationality: 'Romanian', skin_color: 'white')
Celebrity.create(age: 51,name: 'Michael Jackson', male: 1, real_person: 1, dead: 1, domain: 'singer', nationality: 'American', skin_color: 'black')
Celebrity.create(name: 'Batman', male: 1, real_person: 0, dead: 0, domain: 'fiction', nationality: 'American', skin_color: 'white')
Celebrity.create(age: 71,name: 'Nicolae Ceausescu', male: 1, real_person: 1, dead: 1, domain: 'political figure', nationality: 'Romanian', skin_color: 'white')
Celebrity.create(age: 33,name: 'Cristiano Ronaldo', male: 1, real_person: 1, dead: 0, domain: 'sportsman', nationality: 'Portuguese', skin_color: 'white')
Celebrity.create(age: 56,name: 'Jim Carrey', male: 1, real_person: 1, dead: 0, domain: 'actor', nationality: 'American', skin_color: 'white')
Celebrity.create(age: 39,name: 'Kobe Bryant', male: 1, real_person: 1, dead: 0, domain: 'sportsman', nationality: 'American', skin_color: 'black')
Celebrity.create(age: 30,name: 'Rihanna', male: 0, real_person: 1, dead: 0, domain: 'singer', nationality: 'American', skin_color: 'black')
Celebrity.create(age: 35,name: 'Clint Dempsey', male: 1, real_person: 1, dead: 0, domain: 'sportsman', nationality: 'American', skin_color: 'white')


ActiveRecord::Base.connection.execute("TRUNCATE questions")


Question.create(qst:'Is your character male?')
Question.create(qst:'Is your character a real person?')
Question.create(qst:'Is your character dead?')
Question.create(qst:'Is your character a singer?')
Question.create(qst:'Is your character a political figure?')
Question.create(qst:'Is your character a sportsman?')
Question.create(qst:'Is your character an actor?')
Question.create(qst:'Is your character American?')
Question.create(qst:'Is your character Romanian?')
Question.create(qst:"Is your character's skin color black?")
Question.create(qst:"Is your character older than 35?")