class AttachmentsController < ApplicationController
  before_action :authenticate_user!, except: :show
  before_action :set_attachment, only: %i[ edit update destroy ]
  before_action :find_attachment, only: %i[ show ]


  # GET /attachments or /attachments.json
  def index
    @full_domain_path = request.env['rack.url_scheme']
    @full_domain_path = @full_domain_path + '://' + request.host_with_port if request.host_with_port.present?
    @attachments = current_user.attachments.all
  end

  # GET /attachments/1 or /attachments/1.json
  def show
  end

  # GET /attachments/new
  def new
    @attachment = current_user.attachments.new
  end

  # GET /attachments/1/edit
  def edit
  end

  # POST /attachments or /attachments.json
  def create
    @attachment = current_user.attachments.new(attachment_params)

    respond_to do |format|
      if @attachment.save
        format.html { redirect_to attachment_url(@attachment), notice: "Attachment was successfully created." }
        format.json { render :show, status: :created, location: @attachment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @attachment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /attachments/1 or /attachments/1.json
  def update
    respond_to do |format|
      if @attachment.update(attachment_params)
        format.html { redirect_to attachment_url(@attachment), notice: "Attachment was successfully updated." }
        format.json { render :show, status: :ok, location: @attachment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @attachment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /attachments/1 or /attachments/1.json
  def destroy
    @attachment.destroy

    respond_to do |format|
      format.html { redirect_to attachments_url, notice: "Attachment was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_attachment
      @attachment = current_user.attachments.find(params[:id])
    end

    def find_attachment
      @attachment = Attachment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def attachment_params
      params.require(:attachment).permit(:title, :description, :file)
    end
end
