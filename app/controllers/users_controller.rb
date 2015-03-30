class UsersController < ApplicationController
  before_filter :accessible_roles, :only => [:new, :edit, :show, :update, :create]
  skip_authorize_resource :only => :new
  load_and_authorize_resource :only => [:show,:destroy,:edit,:update]

  def new
    @user = User.new
  end

  def create
    p params
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Nuevo Empleado Creado Exitosamente"
      redirect_to farm_employees_path(@user.farm)
    else
      flash.now[:danger] = "No se pudo crear usuario"
      @farm_id = @user.farm.id
      render :new
    end
  end

  def show
    @tasks = @user.tasks
    rescue ActiveRecord::RecordNotFound
      respond_to_not_found(:json, :xml, :html)
  end

  def edit
    rescue ActiveRecord::RecordNotFound
      respond_to_not_found(:json, :xml, :html)
  end

  def update
    if params[:user][:password].blank?
      [:password,:password_confirmation,:current_password].collect{|p| params[:user].delete(p) }
    else
      @user.errors[:base] << "Password es incorrecto" unless @user.valid_password?(params[:user][:current_password])
    end
    if @user.errors[:base].empty? and @user.update(user_params)
      flash[:notice] = "Actualizacion Exitosa"
      redirect_to farm_employees_path(@user.farm)
    else
      render action: :edit
    end
  end

  def destroy
    @farm = @user.farm
    @user.destroy!
    redirect_to farm_employees_path(@farm)
    rescue ActiveRecord::RecordNotFound
       respond_to_not_found(:json, :xml, :html)
  end

  private

   def user_params
    params.require(:user).permit(:name, :email, :role_id, :farm_id, :password, :password_confirmation)
   end

   def accessible_roles
     @accessible_roles = Role.accessible_by(current_ability,:read)
   end
end
