class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy, :process_metadata]
  before_action :process_metadata, only: [:update]
  
   # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    self.process_metadata if @user.save
    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  # Process Metadata into Metavalues attributes
  #TODO: might need process_metadata to be private or protected
  def process_metadata
    @metavalue_attributes = []
    user_params[:metadata].each do |key,value|
      mk = Metakey.find_by_name(key)
      mv = Metavalue.where(metakey_id: mk.id, user_id:@user.id).first
      if mv
        #Update existing metavalue
        @metavalue_attributes << { id: mv.id, value: value }
      else
        #Create new metavalue for user
        @metavalue_attributes << { user_id: @user.id, metakey_id: mk.id, value: value }
      end
    end
    @user.attributes = { metavalues_attributes: @metavalue_attributes }
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.includes(:metakeys, :metavalues).find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:id).tap do |whitelisted|
        whitelisted[:metadata] = params[:user][:metadata] if params[:user][:metadata]
      end
    end
    

    
end
