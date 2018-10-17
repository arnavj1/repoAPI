class Maintenance < ApplicationRecord
    belongs_to :tenant
    belongs_to :landlord

    validates_presence_of :title, :description, :created_on

    validates_date :created_on, on_or_before: lambda { Date.current }


end
