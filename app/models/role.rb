require 'pry'
class Role < ActiveRecord::Base
    has_many :auditions
    def actors
        self.auditions.pluck(:actor)
    end

    def locations
        self.auditions.pluck(:location)
    end

    def lead
        hired = self.auditions.find_by(hired: true) || "no actor has been hired for this role"
    end

    def understudy
        #get all of the auditions for this role where the hired attribute is true
        hired = self.auditions.where(hired: true)
        hired.second || "no actor has been hired for understudy for this role"
        #if there's a second one, return it, otherwise return "no actor..."
    end 

end