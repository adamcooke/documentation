# frozen_string_literal: true

class CreateDocumentationScreenshots < ActiveRecord::Migration[6.0]

  def change
    create_table :documentation_screenshots do |t|
      t.string :alt_text
    end
  end

end
