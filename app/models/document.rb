class Document < ActiveRecord::Base
   has_many :keywords
   has_many :topics
   validates :title, presence: true,
                    length: { minimum: 5 }
   validates :text, presence: true,
                    length: { minimum: 200 }
end
