class Listing < ActiveRecord::Base
	  has_attached_file :image, :styles => { :medium => "200x", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
	  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
	  					:storage => :s3,
      					:s3_credentials => Proc.new{|a| a.instance.s3_credentials }

    def s3_credentials
    	{:bucket => "ruby_demo", :access_key_id => "AKIAI5QBYSYJYXLRO5RQ", :secret_access_key => "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"}
  	end

end
