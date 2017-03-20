class ProdutosController < ApplicationController

	def index
		@produtos_por_nome = Produto.order(:nome).limit 5
		@produtos_por_preco = Produto.order(:preco).limit 2
	end

    def create
    	Produto.create params.require(:produto).permit :nome, :preco, :descricao, :quantidade
    	redirect_to root_url
    end

    def destroy
    	Produto.destroy params[:id]
    	redirect_to root_url
    end

    def busca
    	@produtos = Produto.where "nome like ?", "%#{params[:nome]}"
    end

end
