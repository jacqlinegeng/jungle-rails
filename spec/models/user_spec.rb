require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
   
    
    it 'creates user with matching password' do 
  
      @user = User.new(
        first_name: "jacqline" ,
        last_name: "geng" ,
        email:"jacqlinegeng@gmail.com" ,
        password: "123" ,
        password_confirmation: "123"
      )
      @user.save
      expect(@user.valid?).to eq(true)
     
    end

    it 'does not create user with mis-matching password' do 
  
      @user = User.new(
        first_name: "jacqlinegeng@gmail.com" ,
        last_name: "geng" ,
        email:"jacqlinegeng@gmail.com" ,
        password: "abc" ,
        password_confirmation: "cba"
      )
      @user.save
      expect(@user.valid?).to eq(false)
     
    end

    it 'email must be unique' do 
  
      @user1 = User.new(
        first_name: "jacqline" ,
        last_name: "geng" ,
        email:"jacqlinegeng@gmail.com" ,
        password: "abc" ,
        password_confirmation: "cab"
      )
      @user1.save

      @user2 = User.new(
        first_name: "jacqline" ,
        last_name: "geng" ,
        email:"jacqlinegeng@gmail.com" ,
        password: "ascxzd" ,
        password_confirmation: "dszxca"
      )
      @user2.save
      expect(@user2.valid?).to eq(false)
     
    end

    it 'missing password' do 
  
      @user = User.new(
        first_name: "jacqlinegeng@gmail.com" ,
        last_name: "geng" ,
        email:"jacqlinegeng@gmail.com" ,
        password: nil ,
        password_confirmation: "szcxxzczxc"
      )
      @user.save
      #puts @user.errors.full_messages
      expect(@user.errors.full_messages).to include "Password can't be blank"  
    end

    it 'password too short' do 
  
      @user = User.new(
        first_name: "jacqline" ,
        last_name: "geng" ,
        email:"jacqlinegeng" ,
        password: "asd" ,
        password_confirmation: "asd"
      )
      @user.save
      #puts @user.errors.full_messages
      expect(@user.valid?).to eq(false)
      expect(@user.errors.full_messages).to include "Password is too short (minimum is 6 characters)"  
    end



    it 'missing email' do 
  
      @user = User.new(
        first_name: "jacqline" ,
        last_name: "geng" ,
        email:nil ,
        password: "asddsa" ,
        password_confirmation: "asddsa"
      )
      @user.save
      #puts @user.errors.full_messages
      expect(@user.errors.full_messages).to include "Email can't be blank"  
    end

    it 'missing first_name' do 
  
      @user = User.new(
        first_name: nil ,
        last_name: "geng" ,
        email:"jacqlinegeng@gmail.com" ,
        password: "asddsa" ,
        password_confirmation: "asddsa"
      )
      @user.save
      #puts @user.errors.full_messages
      expect(@user.errors.full_messages).to include "First name can't be blank"  
    end

    it 'missing last_name' do 
  
      @user = User.new(
        first_name: "jacqline" ,
        last_name: nil ,
        email:"jacqlinegeng@gmail.com" ,
        password: "asddsa" ,
        password_confirmation: "asddsa"
      )
      @user.save
      #puts @user.errors.full_messages
      expect(@user.errors.full_messages).to include "Last name can't be blank"  
    end

  end

  describe '.authenticate_with_credentials' do

    it 'emails with extra spaces' do 
  
      @user = User.new(
        first_name: "jacqline" ,
        last_name: "geng" ,
        email:"jacqlinegeng@gmail.com" ,
        password: "asddsaasd" ,
        password_confirmation: "asddsaasd"
      )
      @user.save
      # puts "test"
      # puts @user.inspect
      # puts User.authenticate_with_credentials("     jacqlinegeng@hotmail.com", "asddsaasd").inspect

      #puts @user.errors.full_messages
      expect(User.authenticate_with_credentials("  jacqlinegeng@hotmail.com  ", "asddsaasd")).to eq(@user)
    end

    it 'emails with mixed casing' do 
  
    @user = User.new(
      first_name: "jacqline" ,
      last_name: "geng" ,
      email:"jacqlinegeng@gmail.com" ,
      password: "asddsaasd" ,
      password_confirmation: "asddsaasd"
    )
    @user.save

    expect(User.authenticate_with_credentials("  jaCqLiNeGeNg@gAil.com  ", "asddsaasd")).to eq(@user)
  end

  end


end


# t.string "first_name"
# t.string "last_name"
# t.string "email"
# t.string "password_digest"