class UploadsController < ApplicationController
  before_filter :check_user_signed_in

  def index
    @uploads = Upload.all
  end

  def create
    Upload.create_and_save_file(params[:upload], current_user.id)
    redirect_to uploads_path
  end

  def destroy

  end

end
