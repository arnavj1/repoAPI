class Tenant < ApplicationRecord

    belongs_to :property
    has_many :maintenances
    has_many :reminders, through: :landlord
    has_one :landlord, through: :property


    validates_presence_of :name
    validates :username, presence: true, uniqueness: { case_sensitive: false }
    validates_presence_of :phone
    validates_format_of :phone, with: /\A(\d{10}|\(?\d{3}\)?[-. ]\d{3}[-.]\d{4})\z/, message: "should be 10 digits (area code needed) and delimited with dashes only", allow_blank: true
    validates_presence_of :password, on: :create
    validates_presence_of :password_confirmation, on: :create
    validates_confirmation_of :password, message: "does not match"
    validates_length_of :password, minimum: 4, message: "must be at least 4 characters long"

    
    scope :alphabetical, -> { order(:username) }


    
    def reformat_phone
        phone = self.phone.to_s #conversion to string
        phone.gsub!(/[^0-9]/,"") #strip out non-digits
        self.phone = phone #reset phone
    end

    

end
