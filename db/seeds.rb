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

Talent.create(name: "acrobat")
Talent.create(name: "contortionist")
Talent.create(name: "clown")
Talent.create(name: "juggler")
Talent.create(name: "freak")

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