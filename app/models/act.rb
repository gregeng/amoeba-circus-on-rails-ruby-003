class Act < ActiveRecord::Base
  has_many :amoeba_acts
  has_many :amoebas, :through => :amoeba_acts

  def self.find_acts(act_ids)
    if !act_ids.nil?
      act_ids.collect do |act_id|
          Act.find(act_id)
       end
    else
      []
    end
  end


end
