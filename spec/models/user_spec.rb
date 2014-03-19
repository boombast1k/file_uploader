require 'spec_helper'

describe User do
  context "validation" do
    before do
      @user = User.new(email: 'myemail@mail.my',
                       password: '12345678',
                       password_confirmation: '12345678')
    end

    context "email is invalid" do
      context "wrong format" do
        before do
          @user.email = 'invalid.email'
          subject.valid?
        end

        it "returns errors for email" do
          expect(subject.errors[:email]).to include "is invalid"
        end
      end
    end

    context "password is invalid" do
      context "less then 8 symbols" do
        before do
          @user.password = '1234567'
          @user.password_confirmation = '1234567'
          @user.valid?
        end

        it "returns errors for password" do
          expect(@user.errors[:password]).to include "is too short (minimum is 8 characters)"
        end
      end

      context "different password and password_confirmation" do
        before do
          @user.password = '12345678'
          @user.password_confirmation = '87654321'
          @user.valid?
        end

        it "returns errors for password" do
          expect(@user.errors[:password]).to include "doesn't match confirmation"
        end
      end
    end

    context "valid email" do
      before do
        @user.email = "my_EmaL.123@MaIl.MY"
      end

      it "has no errors" do
        expect(@user.valid?).to eq true
      end
    end
  end

end
