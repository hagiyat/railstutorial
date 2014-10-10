require 'rails_helper'

RSpec.describe "MicropostPages", :type => :request do

  subject { page }

  let(:user) { FactoryGirl.create(:user) }
  before do
    sign_in user
  end

  describe 'micropost creation' do
    before do
      visit root_path
    end

    describe 'with invalid information' do
      it 'should not create a microposts' do
        expect { click_button 'Post' }.not_to change(Micropost, :count)
      end

      describe 'error messages' do
        before do
          click_button 'Post'
        end
        it { should have_content('error') }
      end

      describe 'with valid information' do
        before do
          fill_in 'micropost_content', with: 'Lorem ipsum'
        end
        it 'should create a micropost' do
          expect { click_button 'Post' }.to change(Micropost, :count).by(1)
        end
      end
    end
  end
end
