class Role < ActiveRecord::Base
    has_many :auditions
    def auditionz
      self.auditions.all
    end
    def actors
      self.auditions.map do |audition|
          audition.actor
        end
    end
      # self.auditions.map { |audition| audition.actor }
      # self.auditions.map(&:actor)
    def locations
          self.auditions.map(&:location)
    end
    def lead
        actor = self.auditions.find { |audition| audition.hired }
         if actor
          actor
         else 'no actor has been hired for this role'
        end
    end
    def understudy
        second_hired = self.auditions.where(hired: true).second
          if second_hired == nil
              "no actor"
          else second_hired
        end
    end
end