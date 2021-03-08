class ProjectsController < ApplicationController
  http_basic_authenticate_with name: "dhh", password: "secret", only:[:new] 
  def index
    @projects = Project.all
    puts "\n\n\n\n\n\n==================================================="
    puts params
    puts "\n\n\n\n\n\n"
    if params[:status] != 'all' 
      @projects = @projects.where(status: params[:status])
    end
  end

  def new 
    @project = Project.new
  end

  def create
    @project = Project.new(project_params) 
    if @project.save
      redirect_to dashboard_path
    else 
      render 'new'
    end
  end

  def destroy
    @project = Project.find(params[:id])
    if @project.destroy
      redirect_to dashboard_path
    end
  end

  private 
# es un metodo privado q no va a permitirle a los usuarios meter informacion q no quiero a mi bdd, solo va a permitir esos parámetros
  def project_params
    params.require(:project).permit(:name, :description, :started_at, :ended_at, :status) 
  end
end
