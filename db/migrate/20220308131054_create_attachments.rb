class CreateAttachments < ActiveRecord::Migration[6.1]
  def change
    create_table :attachments do |t|
      t.string :title
      t.text :description
      t.string :file
      t.references :user

      t.timestamps
    end
  end
end
