class CreateBands < ActiveRecord::Migration
  def change
    create_table :bands do |t|
      t.string :name, presence: true, null: false
      t.timestamps
    end
  end
end
