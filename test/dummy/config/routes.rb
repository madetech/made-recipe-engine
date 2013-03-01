Rails.application.routes.draw do

  mount Recipe::Engine => "/recipe"
end
