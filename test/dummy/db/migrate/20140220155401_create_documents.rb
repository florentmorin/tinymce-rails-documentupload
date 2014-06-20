class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.string     :alt,  default: ""
      t.string     :hint, default: ""
      t.attachment :file
      t.timestamps
    end
  end
end