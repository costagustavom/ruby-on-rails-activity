# A tarefinha é nesse arquivo
class ActivitiesController < ApplicationController
    skip_before_action :verify_authenticity_token

    def index
        # listar as atividades (variável activities)
        @activities = Activity.all
        @activity = Activity.new()

        # criar uma atividade (variável activity)
    end
    
    def create
        #Crie uma atividade aqui
        @post = Activity.create(activity_params)
        flash[:msg] = "atividade criada"
        redirect_to activities_index_url


        #Envie uma mensagem com flash[:msg] contendo o alerta

    end

    def destroy
        #Destrua uma atividade por id
        @activity = Activity.find(params[:id])
        @activity.destroy
        flash[:msg] = "excluido com sucesso"
        redirect_to activities_index_url

        #Envie uma mensagem com flash[:msg] contendo o alerta

       
    end

    private

    def activity_params
        #Defina os parâmetros de cada atividade em params
        params.require(:activity).permit(:name,:date,:description)
    end

    def write_alert_on_log
        #Apenas para debug, ignorem isso
        Rails.logger.debug "--------------------------------------"
        Rails.logger.debug "Mensagem de alerta: " + @alert
        Rails.logger.debug "--------------------------------------"
    end
end
