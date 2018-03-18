class Backoffice::AdminsController < BackofficeController
	before_action :set_admin, only: [:edit, :update, :destroy]
	after_action :verify_authorized, only: [:new,:destroy]
	after_action :verify_policy_scoped, only: :index

	def index
		@admins = policy_scope(Admin)
	end

	def new
		@admins = Admin.new
		authorize @admins
	end

	def create
		@admins = Admin.new(params_admin)
		if @admins.save 
			redirect_to backoffice_admins_path, notice: "Administrador (#{@admins.email}) foi cadastrado com sucesso"
		else 
			render:new
		end
	end

	def edit		
	end

	def update		
		password = params[:admin][:password]
		password_confirmation = params[:admin][:password_confirmation]

		if password.blank? && password_confirmation.blank?
			params[:admin].delete(:password)
			params[:admin].delete(:password_confirmation)
		end

		if @admins.update(params_admin)
			AdminMailer.update_mail(current_admin,@admins).deliver_now
			redirect_to backoffice_admins_path, notice: "Administrador (#{@admins.email}) foi atualizada com sucesso"
		else 
			render:edit
		end
	end

	def destroy
		authorize @admins
		admin_email = @admins.email

		if @admins.destroy
			redirect_to backoffice_admins_path, notice: "Administrador (#{admin_email}) excluído com sucesso"
		else 
			render:index
		end
	end	

	private
	def set_admin
		@admins = Admin.find(params[:id])
	end

	def params_admin
		pass = params[:admin][:password]
		if pass.blank?
			params[:admin].except!(:password,:password_confirmation)
		end

		unless @admins.blank?
			params.require(:admin).permit(policy(@admins).permited_attributes)	
		else
			params.require(:admin).permit(:name,:email,:role,:password,:password_confirmation)
		end
		
	end
end
