require 'rails_helper'
describe "get all units route", :type => :request do
    let!(:units) {FactoryBot.create_list(:random_unit, 20)}
    before {get '/units'}
    it 'returns all units' do
        expect(JSON.parse(response.body)['units'].size).to  eq(Unit.page.limit_value)
    end
    it 'returns status code 200' do
        expect(response).to  have_http_status(:success)
    end
    
end
