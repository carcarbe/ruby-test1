class CreateContents < ActiveRecord::Migration
  def change
    create_table :contents do |t|
      t.string :name
      t.integer :order
      t.integer :section_id
      t.integer :project_id
      t.text :info
      t.string :kind

      t.timestamps
    end
  end
end
