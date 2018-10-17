class Tenant < ApplicationRecord

    belongs_to :property
    has_many :maintenances
    has_many :reminders
    has_one :landlord, through: :property

end
