class Reminder < ApplicationRecord
    belongs_to :tenant
    belongs_to :landlord

    validates_presence_of :title, :description, :created_on

end
