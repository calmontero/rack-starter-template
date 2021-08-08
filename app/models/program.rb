class Program < ActiveRecord::Base
    has_many :registers
    has_many :fans, through: :registers
end