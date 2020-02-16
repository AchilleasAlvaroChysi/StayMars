require 'rails_helper'
describe "post authentication credentials", :type => :request do
    10.times do 
        before do
            @user = FactoryBot.create(:random_user)
            post '/auth', params: {username: @user.username, password: @user.password}
        end
        it 'returns same encoded token' do
            expect(JSON.parse(response.body)['token']).to eq(JsonWebToken.encode(user_id: @user.id)) 
        end
        it 'returns the same decoded info' do
            token = JSON.parse(response.body)['token']
            expect(JsonWebToken.decode(token)['user_id']).to eq(JsonWebToken.decode(JsonWebToken.encode(user_id: @user.id))['user_id']) 
        end
    end

end
