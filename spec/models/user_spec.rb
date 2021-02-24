require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end

    context '正常系' do
      it '全て正常に入力されていれば登録できる' do
        expect(@user).to be_valid
      end

      it 'コメントが無くても登録できる' do
        @user.comment = ''
        expect(@user).to be_valid
      end
    end

    context '異常系' do
      it '名前が空だと登録できない' do
        @user.name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Name can't be blank"
      end

      it '名前が30文字より多いと登録できない' do
        @user.name = 'あいうえおかきくけこさしすせそたちつてとなにぬねのまみむめもやゆよ'
        @user.valid?
        expect(@user.errors.full_messages).to include "Name is too long (maximum is 30 characters)"
      end

      it 'emailが空だと登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end

      it 'メールアドレスが重複していると登録できない' do
        @user.save
        other_user = FactoryBot.build(:user)
        other_user.email = @user.email
        other_user.valid?
        expect(other_user.errors.full_messages).to include 'Email has already been taken'
      end

      it 'メールアドレスに@が含まれていないと登録できない' do
        @user.email = 'mailaddressgmail.com'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Email is invalid'
      end

      it 'パスワードが空だと登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end

      it 'パスワードが8文字より少ないと登録できない' do
        @user.password = 'abc123'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password is too short (minimum is 8 characters)'
      end

      it 'パスワードは英字のみだと登録できない' do
        @user.password = 'abcdefgh'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password is invalid'
      end

      it 'パスワードが数字のみだと登録できない' do
        @user.password = '12345678'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password is invalid'
      end

      it '確認用パスワードが空だと登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation can't be blank"
      end

      it 'パスワードが確認用と一致しないと登録できない' do
        @user.password = 'abc123'
        @user.password_confirmation = 'xyz789'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end

      it 'コメントが200文字異常だと登録できない' do
        @user.comment = 'あいうえおかきくけこさしすせそたちつてとなにぬねのはひふへほまみむめもやゐゆゑよらりるれろわいうえを
        がぎぐげござじずぜぞだぢづでどばびぶべぼぱぴぷぺぽあいうえおかきくけこさしすせそたちつてとなにぬねの
        はひふへほまみむめもやゐゆゑよらりるれろわいうえをがぎぐげござじずぜぞだぢづでどばびぶべぼぱぴぷぺぽ
        あいうえおかきくけこさしすせそたちつてとなにぬねのはひふへほまみむめもやゐゆゑよらりるれろわいうえを'
        @user.valid?
        expect(@user.errors.full_messages).to include "Comment is too long (maximum is 200 characters)"
      end
    end
  end
end
