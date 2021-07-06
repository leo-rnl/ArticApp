
require 'faker'

  state_one = State.create(name: "Private")
  state_two = State.create(name: "Public")

  user = User.create(email: "lol@lol.lol", password: "azerty")

  10.times do 
    article = Article.new(title: Faker::Book.title , content: Faker::Lorem.paragraph(sentence_count: 2, supplemental: true, random_sentences_to_add: 4), user_id: user.id, state_id: state_two.id)
    article.save!
  end
