class DiceController < ApplicationController
  def index
    team = Team.find(1)
    @team_name = team.name
    @current_name = Station.find(team.place).station_name
    
    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def result
    @number = rand(6) + 1
    team = Team.find(1)
    @team_name = team.name
    if team.direction == true
      dest = (team.place += @number).modulo(29)
    else
      dest = (team.place -= @number).modulo(29)
    end

    if(dest == 0)
      team.place = 29
    else
      team.place = dest
    end

    team.save

    @dest_name = Station.find(team.place).station_name

    respond_to do |format|
      format.html # result.html.erb
    end
  end
end
