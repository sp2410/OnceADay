class Section < ApplicationRecord
	belongs_to :post
	mount_uploader :external_url, ImageUploader

	
end

