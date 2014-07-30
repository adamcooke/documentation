class CreateDocumentationScreenshots < ActiveRecord::Migration
  def change
    create_table :documentation_screenshots do |t|
      t.string :alt_text
    end
  end
end
