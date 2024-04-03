require 'rails_helper'

RSpec.describe 'ChargingSessions', type: :request do
  let!(:user) { create(:user) }

  describe 'POST /charging_sessions' do
    let(:valid_params) { { charging_session: { user_id: user.id, status: 'active' } } }

    it 'creates a new charging session and returns it as JSON' do
      expect {
        post charging_sessions_path, params: valid_params
      }.to change(ChargingSession, :count).by(1)
      expect(response).to have_http_status(:created)
      expect(json).to include('status' => 'active')
    end
  end

  describe 'PUT /charging_sessions/:id' do
    let!(:charging_session) { create(:charging_session, user: user) }
    let(:update_params) { { charging_session: { status: 'completed' } } }

    it 'updates the charging session status and returns the updated session' do
      put charging_session_path(charging_session), params: update_params
      charging_session.reload
      expect(response).to have_http_status(:ok)
      expect(json).to include('status' => 'completed')
    end
  end
end