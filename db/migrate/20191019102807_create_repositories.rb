class CreateRepositories < ActiveRecord::Migration[5.2]
  def change
    create_table :repositories do |t|
      t.string :name
      t.string :url
      t.integer :stars

      t.timestamps
    end
  end
end
