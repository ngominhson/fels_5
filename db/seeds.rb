(1..30).each do |i|
  User.create(name: "User#{i}", email: "user#{i}@example.com", 
  password: "foobar", password_confirmation: "foobar", is_admin: '0')
end

(1..3).each do |i|
  User.create(name: "Admin#{i}", email: "admin#{i}@example.com", 
  password: "foobar", password_confirmation: "foobar", is_admin: '1')
end 

(1..10).each do |i|
  Category.create(name: "Category#{i}", content: "noi dung #{i}")
end

(1..100).each do |i| 
  Word.create(name: "Word#{i}", description: "description#{i}", category_id: "#{i%10}")
  Option.create(answer: "Option#{i}", word_id: i, is_correct: true)
  (1..3).each do |j|
    Option.create(answer: "Option#{i+j*100}", word_id: i , is_correct: false)
  end
end