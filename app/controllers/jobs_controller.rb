class JobsController < ApplicationController
  def search
    description = search_params['description'].gsub(' ', '+')
    location = search_params['location'].gsub(' ', '+')

    url = "https://jobs.github.com/positions.json?description=#{description}&location=#{location}"
    url += '?full_time=true' if search_params['full_time'] == 1

    response = HTTParty.get(url)
    body = JSON.parse(response.body)

    if body.length == 0
      flash.alert = 'There were no results for that query!'
      redirect_to root_url and return
    end

    body.each do |posting|
      job = Job.create!({
        job_type: posting['type'],
        url: posting['url'],
        posted_on: posting['created_at'],
        company: posting['company'],
        location: posting['location'],
        description: posting['description']
      })
    end

    render "home/index"
  end

  private

  def search_params
    params.require(:search).permit(:description, :location, :full_time)
  end
end
