require 'fileutils'
class Upload
  include Mongoid::Document
  include Mongoid::Timestamps
  field :user_id, type: Integer
  field :filename, type: String
  field :url, type: String
  field :checksum, type: String
  belongs_to :user

  def self.create_and_save_file(upload_io, user_id)
    new_upload = Upload.create(user_id: user_id, filename: upload_io.original_filename)
    url = "hhhh/uploads/#{upload_io.original_filename}_#{new_upload.id}"
    FileUtils.cp(upload_io.path, Rails.root.join('public', 'uploads', "#{upload_io.original_filename}_#{new_upload.id}"))
    checksum = Digest::MD5.file(upload_io.path).to_s
    new_upload.update_attributes(url: url, checksum: checksum)
  end
end
