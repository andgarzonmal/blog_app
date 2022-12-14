class Users::SessionsController < Devise::SessionsController
  respond_to :json, :html
  # before_action :configure_sign_in_params, only: [:create]
  skip_before_action :verify_authenticity_token

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  def create
    self.resource = warden.authenticate!(auth_options)
    set_flash_message!(:notice, :signed_in)
    sign_in(resource_name, resource)
    yield resource if block_given?
    respond_with(resource) do |format|
      format.html { redirect_to after_sign_in_path_for(resource) }
      format.json { render json: { message: 'succesfully logged in' }, status: :ok }
    end
  end

  private

  def respond_to_on_destroy
    respond_to do |format|
      format.json { current_user ? log_out_failure : log_out_success }
      format.any(*navigational_formats) { redirect_to after_sign_out_path_for(resource_name) }
    end
  end

  def log_out_success
    render json: { message: 'Logged out.' }, status: :ok
  end

  def log_out_failure
    render json: { message: 'Logged out failure.' }, status: :unauthorized
  end
end
