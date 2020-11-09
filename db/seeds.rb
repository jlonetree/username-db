# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Username.delete_all
Score.delete_all
UserScore.delete_all

usernames = [
    {name: "vV_HelplessTide_Vv", password: "HappyWok", email: "hisnameis@fight.com"},
    {name: "sYn_typist_nYs", password: "NewYork1", email: "robertpaulson@club.net"},
    {name: "Dystopian_Future", password: "DowntonAbbey", email: "dontHurtMe@ratedr.org"}
]

usernames.each {| username | Username.create(username)}

scores = [
    {amount: 300},
    {amount: 500},
    {amount: 440}
]

scores.each {| score | Score.create(score)}

userscores = [
    {username_id: Username.second.id, score_id: Score.first.id},
    {username_id: Username.first.id, score_id: Score.third.id},
    {username_id: Username.third.id, score_id: Score.second.id}
]

userscores.each { | userscore | UserScore.create(userscore)}