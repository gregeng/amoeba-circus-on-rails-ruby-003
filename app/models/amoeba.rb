class Amoeba < ActiveRecord::Base
  belongs_to :talent
  has_many :amoeba_acts
  has_many :acts, :through => :amoeba_acts



  def self.find_amoebas(amoeba_ids)
    if !amoeba_ids.nil?
      amoeba_ids.collect do |amoeba_id|
          Amoeba.find(amoeba_id)
       end
    else
      []
    end
  end

end
