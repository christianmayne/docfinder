class Person < ActiveRecord::Base

  has_many :person_events, :dependent => :destroy
  has_many :event_types

  accepts_nested_attributes_for :person_events, :allow_destroy => true


  def sex_color
    unless self.sex.blank?
      (self.sex == 'Male') ? '#7CD7E6' : '#F09EB5'
    end
  end

  def sex_symbol
#    unless self.sex.blank?
#      (self.sex == 'Male') ? "♂" : "♀"
#    end
  end

  def event_date
    unless self.person_events.blank?
      birth = self.person_events.find(:first, :joins => :event_type, :conditions => ["event_types.name = 'Birth'"]).try(:date_event).strftime('%d %b %Y') rescue "?"
      death = self.person_events.find(:first, :joins => :event_type, :conditions => ["event_types.name = 'Death'"]).try(:date_event).strftime('%d %b %Y') rescue "?"
      return "#{birth} - #{death}"
    else
      return "? - ?"
    end
#    event = ""
#    unless self.person_events.blank?
#      self.person_events.each do |person_event|
#        if person_event.event_type.name == 'Birth'
#          event += person_event.date_event.blank? ? "ABT" : "#{person_event.date_event.strftime('%d %b %Y')}"
#          if !person_event.city.blank? || !person_event.county.blank? || !person_event.country.blank?
#            event += " ("
#            event += "#{person_event.try(:"city")}, " unless person_event.city.blank?
#            event += "#{person_event.try(:"county")}, " unless person_event.county.blank?
#            event += "#{person_event.try(:"country")}" unless person_event.country.blank?
#            event += ")"
#          end
#          event += " - "
#        end
#        if person_event.event_type.name == 'Death'
#          event += person_event.date_event.blank? ? "ABT" : "#{person_event.date_event.strftime('%d %b %Y')}"
#          if !person_event.city.blank? || !person_event.county.blank? || !person_event.country.blank?
#            event += " ("
#            event += "#{person_event.try(:"city")}, " unless person_event.city.blank?
#            event += "#{person_event.try(:"county")}, " unless person_event.county.blank?
#            event += "#{person_event.try(:"country")}" unless person_event.country.blank?
#            event += ")"
#          end
#        end
#      end
#      event += "? - ?" if event == ""
#    else
#      event += "? - ?"
#    end
#    return event
  end
  
end
