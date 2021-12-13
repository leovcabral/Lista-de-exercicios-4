class Student < ApplicationRecord
  belongs_to :teacher

  validates :name, :matricula, :email, :birthdate, presence: true
  validates :name, :matricula, :email, uniqueness: true 
  validates_date :birthdate, on_or_before: lambda{ Date.current }
  validates_length_of :matricula, is: 9
end
