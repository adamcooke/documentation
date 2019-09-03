class CreateDocumentationPages < ActiveRecord::Migration[5.2]
  def up
    create_table "documentation_pages" do |t|
      t.string :title, :permalink
      t.text :content, :compiled_content
      t.integer :parent_id, :position
      t.timestamps
    end
  end
end
