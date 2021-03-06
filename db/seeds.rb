# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Post.delete_all
Comment.delete_all
Favorite.delete_all
User.delete_all
Tag.delete_all
Tagging.delete_all

Post.create title: "What Are You Going to Do With That?",
			   link: "http://chronicle.com/article/What-Are-You-Going-to-Do-With/124651/",
			   note: "Quote from the article: 'You are much larger than you can imagine'.",
			   tag_list: "life, introspection"

Post.create title: "Welcome to Dinovember",
			   link: "https://medium.com/permanent-marker/welcome-to-dinovember-6f4cb1886d41",
			   note: "A good reminder to embrace your inner kid.",
			   tag_list: "reminder"

Post.create title: "10 Life Lessons I Learned from Surviving My 20s",
			   link: "http://markmanson.net/surviving-my-20s",
			   note: "Survival guide.",
			   tag_list: "life, guide"

Post.create title: "Everyone Deserves Great Design",
			   link: "http://www.everyonedeservesgreatdesign.com/#now",
			   note: "Things to consider as a product designer.",
			   tag_list: "design, guide"

Post.create title: "A Rant on Interaction Design",
			   link: "http://worrydream.com/ABriefRantOnTheFutureOfInteractionDesign/",
			   note: "So what is interaction design about, really?",
			   tag_list: "design, guide"

Post.create title: "Embracing Incompetence",
			   link: "http://dressagetoday.com/article/embrace-incompetence-26425",
			   note: "Stages of learning based on competence level.",
			   tag_list: "life, introspection, growth"