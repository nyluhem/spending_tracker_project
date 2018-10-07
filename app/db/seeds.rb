require_relative("../models/user.rb")
require_relative("../models/transaction.rb")
require_relative("../models/merchant.rb")
require_relative("../models/tag.rb")
require("pry")

Merchant.delete_all
Tag.delete_all
Transaction.delete_all

merchant_1 = Merchant.new({
  "name" => "Amazon"
  })

merchant_2 = Merchant.new({
  "name" => "Deliveroo"
  })

merchant_3 = Merchant.new({
  "name" => "Starbucks"
  })

merchant_4 = Merchant.new({
  "name" => "The Chanter"
  })

merchant_5 = Merchant.new({
  "name" => "Lidl"
  })

merchant_1.save
merchant_2.save
merchant_3.save
merchant_4.save
merchant_5.save

merchants = Merchant.all

tag_1 = Tag.new({
  "name" => "Entertainment"
  })

tag_2 = Tag.new({
  "name" => "Groceries"
  })

tag_3 = Tag.new({
  "name" => "Alcohol"
})

tag_4 = Tag.new({
  "name" => "Beverage"
  })

tag_5 = Tag.new({
  "name" => "Eating Out"
  })

tag_6 = Tag.new({
  "name" => "Clothes"
  })

tag_1.save
tag_2.save
tag_3.save
tag_4.save
tag_5.save
tag_6.save

tags = Tag.all

transaction_1 = Transaction.new({
  "amount" => 12,
  "merchant_id" => merchant_1.id,
  "transaction_time" => Time.now,
  "tag_id" => tag_6.id
    })
transaction_2 = Transaction.new({
  "amount" => 4,
  "merchant_id" => merchant_3.id,
  "transaction_time" => Time.now,
  "tag_id" => tag_4.id
    })

transaction_3 = Transaction.new({
  "amount" => 25,
  "merchant_id" => merchant_2.id,
  "transaction_time" => Time.now,
  "tag_id" => tag_5.id
    })

transaction_4 = Transaction.new({
  "amount" => 8,
  "merchant_id" => merchant_4.id,
  "transaction_time" => Time.now,
  "tag_id" => tag_3.id
    })

transaction_5 = Transaction.new({
  "amount" => 45,
  "merchant_id" => merchant_5.id,
  "transaction_time" => Time.now,
  "tag_id" => tag_2.id
    })

transaction_1.save
transaction_2.save
transaction_3.save
transaction_4.save
transaction_5.save

transactions = Transaction.all



# binding.pry
# nil
