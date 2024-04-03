require 'rails_helper'

RSpec.describe 'Authentication', type: :request do
  let!(:user) { FactoryBot.create(:user) }

    describe 'POST /auth/login' do
        context 'with valid credentials' do
            before { post '/auth/login', params: { email: user.email, password: 'password' } }

            it_behaves_like 'a successful authentication'
        end

        context 'with invalid credentials' do
            before { post '/auth/login', params: { email: user.email, password: 'wrong' } }

            it_behaves_like 'a failed authentication'
        end
    end

    describe 'Token Verification' do
        context 'with valid token' do
            it_behaves_like 'a valid token verification'
        end
    end
end