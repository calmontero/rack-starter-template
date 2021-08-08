class Fan < ActiveRecord::Base
    has_many :registers
    has_many :programs, through: :registers
end