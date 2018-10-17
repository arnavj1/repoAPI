class Landlord < ApplicationRecord
    has_many :properties
    has_many :tenants, through: :properties
    has_many :reminders
    has_many :maintenances, through: :tenants

    
    validates_presence_of :name
    validates_presence_of :phone



end
