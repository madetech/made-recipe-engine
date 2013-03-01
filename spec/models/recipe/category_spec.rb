require 'spec_helper'

module Recipe
  describe Category do
    before(:each) do
      @category = FactoryGirl.create(:recipe_category)
    end

    it "creates a new product category" do
      @category.instance_of?(Recipe::Category)
    end

    it "can't create a new product category without a name" do
      new_category = FactoryGirl.build(:recipe_category, :name => nil)
      new_category.should have(1).error_on(:name)
    end

    it "can't create a new product category without some text" do
      new_category = FactoryGirl.build(:recipe_category, :text => nil)
      new_category.should have(1).error_on(:text)
    end

    it "can create a product category without an image" do
      new_category = FactoryGirl.build(:recipe_category, :image => nil)
      new_category.instance_of?(Recipe::Category)
    end

    it "can create a product category without any items" do
      @category.items.should be_empty
    end

    it "return the category name as a string" do
      @category.name.instance_of?(String)
    end
  end
end
