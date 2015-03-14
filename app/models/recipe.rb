class Recipe < ActiveRecord::Base
	validates :category, presence: true,
                    length: { minimum: 2 }

    validates :title, presence: true,
                    length: { minimum: 5 }

    validates :text, presence: true,
                    length: { minimum: 5 }
end
