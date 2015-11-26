get '/' do
	@urls= Url.all.order(click_counter: :desc)
  erb :"static/index"
end

post '/url' do
	url = Url.create!(long_url: params[:long_url], click_counter: 0)
	redirect '/'
end

get '/:short_url' do
	url = Url.find_by(short_url: params[:short_url])
	
	unless url.nil?
		url.click_counter += 1
		url.save
		redirect url.long_url
	else
		redirect '/'
	end
end

