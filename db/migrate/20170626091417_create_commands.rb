class CreateCommands < ActiveRecord::Migration[5.1]
  def change
    create_table :commands do |t|
      t.string :usercommand
      t.string :adress
      t.integer :zipcode
      t.float :price
      t.integer :unit
      t.date :dateEnter
      t.time :timeEnterFrom
      t.time :timeEnterTo
      t.date :dateModif
      t.time :timeModifFrom
      t.time :timeModifTo
      t.date :dateFinal
      t.time :timeFinalFrom
      t.time :timeFinalTo
      t.text :commentaire
      t.boolean :statewait
      t.boolean :statedone
      t.boolean :asap
      t.integer :user_id

      t.timestamps
    end
  end
end
