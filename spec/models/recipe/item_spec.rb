require 'spec_helper'

module Recipe
  describe Item do
    before(:each) do
      @item = FactoryGirl.create(:recipe_item)
    end

    it "creates a new recipe item" do
      @item.instance_of?(Recipe::Item)
    end

    it "can't create a new recipe item without a name" do
      new_item = FactoryGirl.build(:recipe_item, :name => nil)
      new_item.should have(1).error_on(:name)
    end

    it "can't create a new recipe item without a method" do
      new_item = FactoryGirl.build(:recipe_item, :method => nil)
      new_item.should have(1).error_on(:method)
    end

    it "can't create a new recipe item without an image" do
      new_item = FactoryGirl.build(:recipe_item, :image => nil)
      new_item.should have(1).error_on(:image)
    end

    it "can create a recipe without a category" do
      @item.categories.should be_empty
    end

    it "can create a recipe with a category" do
      FactoryGirl.create(:recipe_with_categories, :name => "Item with Category", :category => "rspec category")
    end

    it "returns the name as a string" do
      @item.name.instance_of?(String)
    end

    it "returns a canonical url" do
      category = FactoryGirl.create(:recipe_category)
      @item.categories = [category]
      @item.get_canonical_url.instance_of?(String)
      @item.get_canonical_url.should eql "/recipe/#{ category.url }/#{ @item.url }"
    end

    it "returns true if in category" do
      category = FactoryGirl.create(:recipe_category)
      @item.categories = [category]
      @item.in_category(category.url).should be_true
    end

    it "returns false if not in category" do
      category = FactoryGirl.create(:recipe_category)
      new_item = FactoryGirl.create(:recipe_with_categories, :name => "Item with Category", :category => "rspec category")
      new_item.in_category(category.url).should be_false
    end

    it "returns false if category doesn't exist" do
      @item.in_category('fake-category').should be_false
    end

    it "returns two recipes in the same category in the correct order" do
      category = FactoryGirl.create(:recipe_category)
      @item.categories = [category]
      new_item = FactoryGirl.create(:recipe_item, :name => 'Second recipe', :order => 2, :categories => [category])
      recipes = category.items
      recipes.count.should eql 2
      recipes.first.id.should_not eql new_item.id
      recipes.last.id.should eql new_item.id
    end
  end
end
