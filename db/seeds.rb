# Create categories
cat1 = Category.create(name: 'Cate 1')
cat2 = Category.create(name: 'Cate 2')

# Create products
Product.create(price: 100, category: cat1)
Product.create(price: 200, category: cat1)
Product.create(price: 300, category: cat2)

# Create discounts
Discount.create(percentage: 5, category: cat1)

# Create users
User.create(token: SecureRandom.hex(8), purchase_count: 2)
User.create(token: SecureRandom.hex(8), purchase_count: 3)
