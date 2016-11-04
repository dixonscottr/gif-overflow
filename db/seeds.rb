require 'faker'

User.delete_all
Vote.delete_all
Answer.delete_all
Question.delete_all
Comment.delete_all

users = 10.times.map do
  User.create!( :username   => Faker::Internet.user_name,
                :email      => Faker::Internet.email,
                :password   => 'password' )
end

questions = 100.times.map do
  Question.create!( title: Faker::Hipster.words((5..10).to_a.sample).join(" ").capitalize + "?",
                    description: Faker::Hipster.paragraph(3),
                    author_id: (1..10).to_a.sample )
end

comments = 100.times.map do
  Comment.create!( response: Faker::Hacker.say_something_smart,
                   commenter_id: (1..10).to_a.sample,
                   commentable_id: (1..50).to_a.sample,
                   commentable_type: ["Question", "Answer"].sample)
end

answers = 100.times.map do
  Answer.create!( gif: Faker::Avatar.image,
                  answerer_id: (1..10).to_a.sample,
                  question_id: (1..50).to_a.sample)
end

votes = 100.times.map do
  Vote.create( voter_id: (1..10).to_a.sample,
                voteable_id: (1..100).to_a.sample,
                voteable_type: ["Question", "Answer", "Comment"].sample,
                vote_direction: [-1, 1].sample)
end
