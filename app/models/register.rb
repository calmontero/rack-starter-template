class Register < ActiveRecord::Base
    belongs_to :programs
    belongs_to :persons
end