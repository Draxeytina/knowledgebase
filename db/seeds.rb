require 'faker'

# generate 60 articles
60.times do
  Article.create(
    title: Faker::Book.unique.title,
    body: Faker::Hipster.paragraph(sentence_count: 30)
  )
end