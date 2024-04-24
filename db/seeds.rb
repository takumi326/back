# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Purpose.create!(
  [
    { title: '野球のルール基礎知識',user_id: "2",deadline: "2024-04-21" },
    { title: 'プロ野球選手のトレーニング方法',user_id: "2",deadline: "2024-05-21" },
    { title: '野球の歴史とは',user_id: "2",deadline: "2024-06-21" },
    { title: 'メジャーリーグと日本プロ野球の違い',user_id: "2",deadline: "2024-04-21" },
    { title: '野球用具の選び方',user_id: "1",deadline: "2024-04-22" },
    { title: '野球のポジション紹介',user_id: "2",deadline: "2024-04-23" },
    { title: '野球の戦術入門',user_id: "3",deadline: "2024-03-21" },
    { title: '子供向け野球教室の選び方',user_id: "4",deadline: "2024-08-21" },
  ]
)