(1..30).each do |i|
  User.create(name: "User#{i}", email: "user#{i}@example.com", 
  password: "foobar", password_confirmation: "foobar", is_admin: '0')
end

(1..3).each do |i|
  User.create(name: "Admin#{i}", email: "admin#{i}@example.com", 
  password: "foobar", password_confirmation: "foobar", is_admin: '1')
end