FactoryGirl.define do

  factory :recipe_ingredient, class: Recipe::Ingredient do
    name        "Flour"
    quantity    "10g"
  end

  factory :recipe_category, class: Recipe::Category do
    name        "Category"
    order       1
    text        "Lorem Ipsum"
  end

  factory :recipe_item, class: Recipe::Item do
    name         "Test Recipe"
    description  "This is a test recipe"
    cook_time    60
    image        { File.new(Recipe::Engine.root.join('spec', 'fixtures', 'test.jpg')) }
    method       "This is how to cook this"
    order        1
    prep_time    10
    serves       4
    ingredients  [FactoryGirl.create(:recipe_ingredient)]

    ignore do
      category false
    end

    factory :recipe_with_categories do |a|
      a.categories { |c| [
          c.association(:recipe_category,  name: c.category)
        ]
      }
    end
    factory :recipe_with_ingredients do |a|
      a.ingredients { |c| [
          c.association(:recipe_ingredient,  name: c.ingredient)
        ]
      }
    end
  end

end

