class SubjectsController < ApplicationController

	#before_ACTION são ações realizadas pre carregamento de qualquer função do controller
	before_action :find_subject, only: [:show, :edit, :update, :destroy]

	def index
		#declara uma especie de array que recebe e exibe todas as disciplinas em ordem inversa de criação
		@subjects = Subject.all.order("created_at DESC")		
	end

	def show
	
	end


	def new
		#cria a instancia vazia
		@subject = Subject.new
	end



	def create
		#cria uma nova disciplina
		@subject = Subject.new(subject_params)

		#se a disciplina for criada ele redireciona para a index, senão, renderiza o form novamente
		if @subject.save
			redirect_to root_path
		else
			render 'new'	
		end
	end

	def edit
		
	end

	def update
		if @subject.update(subject_params)
			redirect_to subject_path(@subject)
		else
			render 'edit'
		end
	end



	def destroy
		@subject.destroy
		redirect_to root_path
	end


		private

		def subject_params
			params.require(:subject).permit(:name, :semester)
		end

		def find_subject
			@subject = Subject.find(params[:id])
		end
end
