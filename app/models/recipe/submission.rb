module Recipe
  class Submission < ActiveRecord::Base
    self.table_name = "recipe_submissions"

    attr_accessible                 :first_name,
                                    :last_name,
                                    :city,
                                    :email,
                                    :recipe_name,
                                    :image,
                                    :video,
                                    :description,
                                    :prep_time,
                                    :cook_time,
                                    :serves,
                                    :ingredients,
                                    :method,
                                    :created_at

    has_attached_file               :image,
                                    :styles => {
                                      :main => Recipe.config.main_item_image_size,
                                      :thumb => Recipe.config.item_thumb_size
                                    }

    validates_presence_of           :title,
                                    :first_name,
                                    :last_name,
                                    :city,
                                    :email,
                                    :recipe_name,
                                    :image,
                                    :description,
                                    :prep_time,
                                    :cook_time,
                                    :serves,
                                    :ingredients,
                                    :method

    validates_format_of             :email, :with => /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]+\z/

    validates_attachment_size       :image, :less_than => 2.megabytes,
                                    :unless => Proc.new { |submisssion| submisssion.image.blank? }

    default_scope                   :order => 'created_at DESC'

    def to_s
      "#{recipe_name} by #{first_name} #{last_name}"
    end
  end
end
