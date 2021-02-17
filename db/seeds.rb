User.create!(name:  "伊吹 五郎",
             email: "example@todoapp.org",
             password:              "foobar",
             password_confirmation: "foobar")

39.times do |n|
  name  = Gimei.unique.name
  email = "example-#{ n + 1 }@todoapp.org"
  User.create!(name:  name.kanji,
               email: email,
               password:              "foobar",
               password_confirmation: "foobar")
end

require 'date'

Task.create!(title: "買い出し",
             description: "食材。玉ねぎ、ショウガ、醤油",
             state: "todo",
             due_date: Date.new(2021, 2, 24),
             user_id: 1)

Task.create!(title: "洗濯物を取り込む",
             description: "帰ったらすぐやる。",
             state: "todo",
             due_date: Date.new(2021, 2, 24),
             user_id: 1)

Task.create!(title: "引越し業者に連絡",
             description: "3社から相見積もりをする。",
             state: "todo",
             due_date: Date.new(2021, 2, 28),
             user_id: 1)

Task.create!(title: "コンビニで振込み",
             description: "アマゾンで注文した椅子代。4,730円。",
             state: "todo",
             due_date: Date.new(2021, 2, 25),
             user_id: 2)

Task.create!(title: "誕生日プレゼント選び",
             description: "××モールで。財布かカバン？",
             state: "todo",
             due_date: Date.new(2021, 3, 11),
             user_id: 2)