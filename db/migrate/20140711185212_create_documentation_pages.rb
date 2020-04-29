# frozen_string_literal: true

class CreateDocumentationPages < ActiveRecord::Migration[6.0]

  def up
    create_table 'documentation_pages' do |t|
      t.string :title, :permalink
      t.text :content, :compiled_content
      t.integer :position
      t.belongs_to :parent, polymorphic: true
      t.timestamps
    end
  end

  def down
    drop_table :documentation_pages
  end

end
