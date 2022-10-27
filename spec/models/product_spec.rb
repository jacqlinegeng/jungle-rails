require 'rails_helper'


RSpec.describe Product, type: :model do
  describe 'Validations' do
   
  context 'product with all four fields set will indeed save successfully' do
   it 'successful product save ' do 

    @category = Category.create(
      name: "plants"
    )

    @product = Product.create(
      name: "flower",
      price_cents: 500,
      quantity: 1,
      category_id: @category.id
    )

    expect(@product).to be_present
   end
  end


   context 'empty name field ' do 
    it 'expects error message - Name cant be blank' do
    @category = Category.create(
      name: "plants"
    )

    @product = Product.create(
      name: nil,
      price_cents: 500,
      quantity: 1,
      category_id: @category.id
    )

    expect(@product.errors.full_messages).to include "Name can't be blank"
    
   end
  end

  context 'empty price_cents field ' do 
    it 'expects error message - Price cents cant be blank' do
    @category = Category.create(
      name: "plants"
    )

    @product = Product.create(
      name: 'flower',
      price_cents: nil,
      quantity: 1,
      category_id: @category.id
    )
 
    expect(@product.errors.full_messages).to include "Price cents can't be blank"  
   end
  end

  context 'empty quantity field ' do 
    it 'expects error message - Quantity cant be blank' do
    @category = Category.create(
      name: "plants"
    )

    @product = Product.create(
      name: 'flower',
      price_cents: 500,
      quantity: nil,
      category_id: @category.id
    )

    expect(@product.errors.full_messages).to include "Quantity can't be blank"  
   end
  end

  context 'empty category_id field ' do 
    it 'expects error message - Category can\'t be blank' do
    @category = Category.create(
      name: "plants"
    )
    @product = Product.create(
      name: 'flower',
      price_cents: 500,
      quantity: 1,
      category_id: nil
    )
    expect(@product.errors.full_messages).to include "Category can't be blank"  
   end
  end
  



  end
end


# Each example (it) is run in isolation of others. Therefore each example will needs its own @category created 
# and then @product initialized with that category
# Create an initial example that ensures that a product with all four fields set will indeed save successfully
# Have one example for each validation, and for each of these:
# Set all fields to a value but the validation field being tested to nil
# Test that the expect error is found within the .errors.full_messages array
# You should therefore have five examples defined given that you have the four validations above