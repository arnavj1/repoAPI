class Property < ApplicationRecord

    has_many :tenants
    belongs_to :landlord 


    validates_presence_of :addr_line1, :city, :state, :zipcode, :rent, :start_date
    validate :not_duplicate?, on: :create



    scope :active, -> { where(active: true) }




    def not_duplicate?
        if Property.where(["addr_line1 = ? and zipcode = ?", self.addr_line1, self.zipcode]).any?
            errors.add(:addr_line1, "already exists!")
        else
            return true
        end
    end

end
