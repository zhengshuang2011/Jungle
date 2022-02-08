require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    # validation tests/examples here
    it "should be valid" do 
      @product = Product.new
      @cat4 = Category.new
      @cat4.name = 'Book'
      @product.name = 'New Book'
      @product.quantity = 10
      @product.price = 100
      @product.category = @cat4
      expect(@product.valid?).to be true
    end

    it "should have name" do
      @product = Product.new
      @product.name = nil 
      @product.valid?
      expect(@product.errors[:name]).to include ("can't be blank")

      @product.name = 'New Book' 
      @product.valid?
      expect(@product.errors[:name]).not_to include ("can't be blank")
    end

    it "should have price" do
      @product = Product.new
      @product.price = nil 
      @product.valid?
      expect(@product.errors[:price]).to  include("is not a number")
  
      @product.price = 100
      @product.valid? 
      expect(@product.errors[:price]).not_to  include("can't be blank")
    end

    it "should have quantity" do
      @product = Product.new
      @product.quantity = nil
      @product.valid?
      expect(@product.errors[:quantity]).to  include("can't be blank")
  
      @product.quantity = 10
      @product.valid? 
      expect(@product.errors[:quantity]).not_to  include("can't be blank")
    end

    it "should belogs to one category" do
      @cat4 = Category.new
      @product = Product.new
      @product.category = nil 
      @product.valid?
      expect(@product.errors[:category]).to  include("can't be blank")

      @product.category = @cat4
      @product.valid? 
      expect(@product.errors[:category]).not_to  include("can't be blank")
    end
  end
end
