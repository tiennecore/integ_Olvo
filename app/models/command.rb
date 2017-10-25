class Command < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :adress, presence: true
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
      @command = Command.create(:adress => row[0],:zipcode => row[1],:dateEnter => row[2],:timeEnterFrom => row[3],:timeEnterTo => row[4], :unit => row[5],:commentaire => row[6],:usercommand => row[7])
      @command.usercommand = current_user
      @command.statewait=false
      @command.statedone=false
      if @command.zipcode.present?
        if (@command.zipcode > 75000) && (@command.zipcode < 75021)
          @command.price = @user.price1
        else
          @command.price =  @user.price2
        end
      end
      date_actuel = DateTime.now
      # cas de non ajout de la date
      if @command.dateFinal == nil
        @command.dateEnter = date_actuel
        @command.asap = 1
      end
      if @command.timeEnterFrom == nil
        @command.timeEnterFrom = date_actuel.change(hour: 11, min: 0)
      end
      if @command.timeEnterTo == nil
        @command.timeEnterTo = date_actuel.change(hour: 24, min: 0)
      end

      #initialisation de la date normal selectionner
      @command.usercommand = current_user.username
      @command.dateFinal = @command.dateEnter
      @command.timeFinalFrom = @command.timeEnterFrom
      @command.timeFinalTo = @command.timeEnterTo

      # cas d'inversion de des horaires
      if @command.dateEnter?
        if @command.timeFinalFrom > @command.timeFinalTo && @command.dateEnter?
          tmpdate=@command.dateFinal
          tmpdate=@command.timeFinalFrom
          @command.timeFinalFrom = @command.timeFinalTo
          @command.timeFinalTo = tmpdate
        end
      end
      commandesTmp.push(@command)
    end
    # check de la validité de toutes les commandes
    commandesTmp.each do |tmp|
      if tmp.adress? && tmp.zipcode? && tmp.unit? && tmp.usercommand?
      else
        errorImport = 1
        break
      end
    end
    #sauvegardes des commandes
    if errorImport != 1
      commandesTmp.each do |savecommand|
        savecommand.save
      end
    end
  end

end
