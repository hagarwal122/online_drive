class TinyController < ApplicationController
  before_action :find_tiny_record, only: %i[ show ]

  def show
  end

  private
  def find_tiny_record
    @attachment = Attachment.find(params[:id])
  end
end
