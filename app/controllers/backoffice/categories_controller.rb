class Backoffice::CategoriesController < BackofficeController
	before_action :set_category, only: [:edit, :update]

	def index
		@categories = Category.all
	end

	def new
		@categories = Category.new
	end

	def create
		@categories = CategoriesService.create(params_category)

		unless @category.errors.any? 
			redirect_to backoffice_categories_path, notice: "A categoria (#{@categories.description}) foi cadastrada com sucesso"
		else 
			render:new
		end
	end

	def edit		
	end

	def update		
		if @categories.update(params_category)
			redirect_to backoffice_categories_path, notice: "A categoria (#{@categories.description}) foi atualizada com sucesso"
		else 
			render:edit
		end
	end

	def set_category
		@categories = Category.find(params[:id])
	end

	private
	def params_category
		params.require(:category).permit(:description)
	end
end
