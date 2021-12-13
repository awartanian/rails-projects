class CreateUpdates < ActiveRecord::Migration[6.1]
  def change
    create_table :updates do |t|
      t.text :text

      t.references :project

      t.timestamps
    end
  end
end
