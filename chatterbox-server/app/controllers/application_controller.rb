class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add routes
  get '/messages' do
    msgs = Message.all.order(created_at: :asc)
    msgs.to_json
  end

  post '/messages' do
    msg = Message.create(
      body: params[:body],
      username: params[:username]
    )
    msg.to_json
  end

  patch '/messages/:id' do
    upd = Message.find(params[:id])
    upd.update(
      body: params[:body]
    )
    upd.to_json
  end

  delete '/messages/:id' do
    toss = Message.find(params[:id])
    toss.destroy
    toss.to_json
  end
  
end
