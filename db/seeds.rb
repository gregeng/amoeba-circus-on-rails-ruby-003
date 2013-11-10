# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


#### Model Brainstorm

### will need to seed data for the special talents table it just has id and name

# First he will need to be able to input all his Amoeba performers into a list keeping track of their name, special talent: acrobat, contortionist, clown, juggler, or freak; and their generation number based on the number of splits that occured up to their creation.

# Each time an amoeba splits the old amoeba dissapears and two new amoebas are created sharing the special talent of their parent.

# Models
## Amoebas
#   -name
#   -talent_id
#   -generation number

# amoeba has many acts through amoeba_acts
# amoeba has many amoeba_acts
# amoeba belongs to a talent

## Talent
# talent has many amoebas

# amoeba_acts

# belongs_to amoeba
# belongs_to act

## Act
#   -name
#   -date
#   -time

# act has many amoebas through amoeba_acts
# act has many amoeba_acts

## seems like this is two separate problems generation, and then the other stuff
## dont worry about the generation number problem for now... will either behandled in the model or the controller

Talent.create(name: "acrobat")
Talent.create(name: "contortionist")
Talent.create(name: "clown")
Talent.create(name: "juggler")
Talent.create(name: "freak")

audrey = Amoeba.new
audrey.name = "Audrey"
audrey.generation = 1
audrey.talent = Talent.find(1)
audrey.save

greg = Amoeba.new
greg.name = "Greg"
greg.generation = 1
greg.talent = Talent.find(2)
greg.save

jon = Amoeba.new
jon.name = "Jon"
jon.generation = 1
jon.talent = Talent.find(3)
jon.save

scott = Amoeba.new
scott.name = "Scott"
scott.generation = 1
scott.talent = Talent.find(4)
scott.save

spencer = Amoeba.new
spencer.name = "Spencer"
spencer.generation = 1
spencer.talent = Talent.find(5)
spencer.save

plate_spinning = Act.create(name: "plate-spinning", date: Time.now.strftime("%Y-%m-%d") , time: Time.now.strftime("%H:%M"))
plate_spinning.amoebas = Amoeba.all.shuffle[0..2]
plate_spinning.save

juggling = Act.create(name: "juggling", date: Time.now.strftime("%Y-%m-%d") , time: Time.now.strftime("%H:%M"))
juggling.amoebas = Amoeba.all.shuffle[0..2]
juggling.save

gymnastics = Act.create(name: "gymnastics", date: Time.now.strftime("%Y-%m-%d") , time: Time.now.strftime("%H:%M"))
gymnastics.amoebas = Amoeba.all
gymnastics.save

daredevils = Act.create(name: "daredevils", date: Time.now.strftime("%Y-%m-%d") , time: Time.now.strftime("%H:%M"))
daredevils.amoebas = Amoeba.all.shuffle[0..3]
daredevils.save

tightrope = Act.create(name: "tightrope", date: Time.now.strftime("%Y-%m-%d") , time: Time.now.strftime("%H:%M"))
tightrope.amoebas = Amoeba.all.shuffle[0..3]
tightrope.save

