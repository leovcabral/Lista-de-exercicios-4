class Teacher < ApplicationRecord
    has_one :language
    has_many :students

    validates :name, :email, :birthdate, presence: true
    validates :name, :email, uniqueness: true 
    validates_date :birthdate, on_or_before: lambda{ Date.current }
end
