# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Category.create!(
  [
    { name: '食費',category_type: "payment" },
    { name: '日用品',category_type: "payment" },
    { name: '衣服',category_type: "payment" },
    { name: '交際費',category_type: "payment" },
    { name: '医療費',category_type: "payment" },
    { name: '交通費',category_type: "payment" },
    { name: '通信費',category_type: "payment" },
    { name: '光熱費',category_type: "payment" },
    { name: '住居費',category_type: "payment" },
    { name: '教育費',category_type: "payment" },
    { name: '給料',category_type: "income" },
    { name: 'おこづかい',category_type: "income" },
    { name: '賞与',category_type: "income" },
    { name: '副業',category_type: "income" },
    { name: '投資',category_type: "income" },
    { name: '臨時収入',category_type: "income" },
  ]
)