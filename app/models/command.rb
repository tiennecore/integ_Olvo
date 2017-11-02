class Command < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :adress, presence: true
  validates :name, presence: true
  validates :zipcode, presence: true, numericality: true
  validates_length_of :zipcode, is: 5
  validates :unit, presence: true, numericality: true




  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |command|
        csv << command.attributes.values_at(* column_names)
      end
    end
  end

  def self.import(file)
    commandesTmp=[]
    errorImport=0
    CSV.foreach(file.path, headers: true) do |row|
      @command = Command.create(:name => row[0],:adress => row[1],:zipcode => row[2],:dateEnter => row[3],:timeEnterFrom => row[4],:timeEnterTo => row[5], :unit => row[6],:commentaire => row[7])

    end
    # check de la validité de toutes les commandes
    #commandesTmp.each do |tmp|
    #  if tmp.adress? && tmp.zipcode? && tmp.unit? && tmp.usercommand?
    #  else
    #    errorImport = 1
    #    break
    #  end
    #end
    #sauvegardes des commandes
    #if errorImport != 1
    #  commandesTmp.each do |savecommand|
    #    savecommand.save
    #  end
    #end
  end

end
