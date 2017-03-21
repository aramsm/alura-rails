class ProdutosController < ApplicationController

	before_action :set_produto, only: [:edit, :update, :destroy]

	def index
		@produtos_por_nome = Produto.order(:nome).limit 5
		@produtos_por_preco = Produto.order(:preco).limit 2
	end

	def new
		@produto = Produto.new
		@departamentos = Departamento.all
	end

	def edit
		render_(:edit)
	end

	def update
		if @produto.update produto_params
			flash[:notice] = "Produto atualizado com sucesso!" 
        	redirect_to root_url
    	else
    		render_(:edit)
    	end
	end

    def create
    	@produto = Produto.new produto_params
        if @produto.save
        	flash[:notice] = "Produto criado com sucesso!" 
        	redirect_to root_url
    	else
    		render_(:new)
    	end
    end

    def destroy
    	@produto.destroy
    	redirect_to root_url
    end

    def busca
    	@produtos = Produto.where "nome like ?", "%#{params[:nome]}"
    end


    private
	    def set_produto
	    	@produto = Produto.find params[:id]
	    end

	    def render_(view)
			@departamentos = Departamento.all
	    	render view
		end

		def produto_params
	        params.require(:produto).permit :nome, :preco, :descricao, :quantidade, :departamento_id
	    end

end
