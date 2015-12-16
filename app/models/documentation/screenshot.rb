module Documentation
  class Screenshot < ActiveRecord::Base

    attachment :upload

    before_validation do
      if self.upload_file && self.alt_text.blank?
        self.alt_text = self.upload_file.original_filename
      end
      true
    end

  end
end
