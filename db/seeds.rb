# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Article.delete_all

Article.create title: "What Are You Going to Do With That?",
			   link: "http://chronicle.com/article/What-Are-You-Going-to-Do-With/124651/",
			   comment: "Quote from the article: 'You are much larger than you can imagine'."

Article.create title: "Welcome to Dinovember",
			   link: "https://medium.com/permanent-marker/welcome-to-dinovember-6f4cb1886d41",
			   comment: "A good reminder to embrace your inner kid."

Article.create title: "10 Life Lessons I Learned from Surviving My 20s",
			   link: "http://markmanson.net/surviving-my-20s",
			   comment: "Survival guide."

Article.create title: "Everyone Deserves Great Design",
			   link: "http://www.everyonedeservesgreatdesign.com/#now",
			   comment: "Things to consider as a product designer."