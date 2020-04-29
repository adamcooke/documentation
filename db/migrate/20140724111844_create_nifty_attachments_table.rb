# frozen_string_literal: true

class CreateNiftyAttachmentsTable < ActiveRecord::Migration[6.0]

  def up
    create_table :nifty_attachments do |t|
      t.belongs_to :parent, polymorphic: true
      t.string :parent_type, :token, :digest, :role, :file_name, :file_type
      t.binary :data, limit: 10.megabytes
      t.timestamps
    end
  end

  def down
    drop_table :nifty_attachments
  end

end
