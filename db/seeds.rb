# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Category.create!(
#   [
#     { name: '食費',category_type: "payment" },
#     { name: '日用品',category_type: "payment" },
#     { name: '衣服',category_type: "payment" },
#     { name: '交際費',category_type: "payment" },
#     { name: '医療費',category_type: "payment" },
#     { name: '交通費',category_type: "payment" },
#     { name: '通信費',category_type: "payment" },
#     { name: '光熱費',category_type: "payment" },
#     { name: '住居費',category_type: "payment" },
#     { name: '教育費',category_type: "payment" },
#     { name: '給料',category_type: "income" },
#     { name: 'おこづかい',category_type: "income" },
#     { name: '賞与',category_type: "income" },
#     { name: '副業',category_type: "income" },
#     { name: '投資',category_type: "income" },
#     { name: '臨時収入',category_type: "income" },
#   ]
# )

# Account.create!(
#   [
#     { name: 'みずほ',user_id: 2,amount:100000},
#     { name: '楽天',user_id: 2,amount:500000},
#     { name: '三井住友',user_id: 2,amount:5000},
#   ]
# )

# Transfer.create!(
#   [
#     { user_id: 2,schedule: Date.today,before_account_id:1,after_account_id:2,amount:100},
#     { user_id: 2,schedule: Date.today,before_account_id:2,after_account_id:3,amount:200},
#     { user_id: 2,schedule: Date.today,before_account_id:1,after_account_id:3,amount:300},
#   ]
# )

# Classification.create!(
#   [
#     { user_id: 2,account_id: 6,name: "楽天クレカ",amount:100,category_type: "payment"},
#     { user_id: 2,account_id: 6,name: "Amazonクレカ",amount:200,category_type: "payment"},
#     { user_id: 2,account_id: 6,name: "PayPayクレカ",amount:300,category_type: "payment"},
#     { user_id: 2,account_id: 6,name: "A会社",amount:100,category_type: "income"},
#     { user_id: 2,account_id: 6,name: "B会社(副業)",amount:200,category_type: "income"},
#     { user_id: 2,account_id: 6,name: "C会社",amount:300,category_type: "income"},
#   ]
# )

# Payment.create!(
#   [
#     { user_id: 2,classification_id:1,category_id:12,schedule: Date.today,amount:100},
#     { user_id: 2,classification_id:2,category_id:13,schedule: Date.today,amount:5000},
#     { user_id: 2,classification_id:3,category_id:14,schedule: Date.today,amount:9000},
#     { user_id: 2,classification_id:1,category_id:14,schedule: Date.today,amount:6000},
#     { user_id: 2,classification_id:2,category_id:12,schedule: Date.today,amount:70000},
#     { user_id: 2,classification_id:3,category_id:13,schedule: Date.today,amount:3000},
#   ]
# )

ClassificationMonthlyamount.create!(
  [
    { classification_id:  10,month: 20245,amount:0},
    { classification_id: 12,month: 20245,amount:0},
    { classification_id: 9,month: 20245,amount:748},
    { classification_id: 11,month: 20245,amount:5000},
    { classification_id: 13,month: 20245,amount:14780},
    { classification_id: 8,month: 20245,amount:19927},
  ]
)