class ProdutosController < ApplicationController

	def index
		@produtos = Produto.order(:nome).limit 5
		@produtos_por_preco = Produto.order(:preco).limit 2
	end

	def new
		@produto = Produto.new
	end

    def create
    	@produto = Produto.new params.require(:produto).permit :nome, :preco, :descricao, :quantidade
        if @produto.save
        	flash[:notice] = "Produto criado com sucesso!" 
        	redirect_to root_url
    	else
    		render :new
    	end
    end

    def destroy
    	Produto.destroy params[:id]
    	redirect_to root_url
    end

    def busca
    	@produtos = Produto.where "nome like ?", "%#{params[:nome]}"
    end

end
