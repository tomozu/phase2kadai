class CreateTalks < ActiveRecord::Migration[5.1]
  def change
    create_table :talks do |t|
    t.text :content
    end
  end
end
