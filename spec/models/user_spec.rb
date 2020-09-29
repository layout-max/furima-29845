require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    describe 'ユーザー新規登録' do
      context '新規登録がうまくいくとき' do
        it "nicknameとemailとpasswordとzenkaku_familynameとzenkaku_nameとkatakana_family_kanaとkatakana_name_kanaとbirthdayが存在すれば登録できること" do
          expect(@user).to be_valid
        end
        it "emailに@があれば登録できること" do
          @user.email = "123@4"
          expect(@user).to be_valid
        end
        it "passwordが6文字以上であれば登録できること" do
          @user.password = "a123456"
          @user.password_confirmation = "a123456"
          expect(@user).to be_valid
        end
        it "passwordが英字のみではないと登録できること" do
          @user.password = "asdfgh1"
          @user.password_confirmation = "asdfgh1"
          expect(@user).to be_valid
        end
        it "passwordが数字のみでないと登録できること" do
          @user.password = "123a456"
          @user.password_confirmation = "123a456"
          expect(@user).to be_valid
        end
        it "passwordに全角がなければ登録できること" do
          @user.password = "a123456"
          @user.password_confirmation = "a123456"
          expect(@user).to be_valid
        end
        it "zenkaku_familynameに半角が入っていないと登録できること" do
          @user.zenkaku_familyname = "山田"
          expect(@user).to be_valid
        end
        it "zenkaku_nameに半角が入っていないと登録できること" do
          @user.zenkaku_name = "洋平"
          expect(@user).to be_valid                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
        end
        it "katakana_family_kanaに半角が入っていないと登録できること" do
          @user.katakana_family_kana = "ヤマダ"
          expect(@user).to be_valid
        end
        it "katakana_name_kanaに半角が入っていないと登録できること" do
          @user.katakana_name_kana = "タカ"
          expect(@user).to be_valid
        end
      end
    end


    context '新規登録がうまくいかないとき' do
      it "nicknameが空では登録できないこと" do
        @user.nickname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it "emailが空では登録できないこと" do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it "重複したemailが存在する場合登録できないこと" do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
      end

      it "emailに＠がなければ登録できないこと" do
        @user.email = "1234"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end

      it "passworeが空では登録できないこと" do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank", "Password confirmation doesn't match Password")
      end

      it "passwordが存在してもpassword_confirmationが空では登録できないこと" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it "passwordが5文字以下であれば登録できないこと" do
        @user.password = "a1234"
        @user.password_confirmation = "a1234"
        @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end

      it "passwordが英字のみだと登録できないこと" do
        @user.password = "asdfgh"
        @user.password_confirmation = "asdfgh"
        @user.valid?
      expect(@user.errors.full_messages).to include("Password は半角英数で入力してください。")
      end

      it "passwordが数字のみだと登録できないこと" do
        @user.password = "123456"
        @user.password_confirmation = "123456"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password は半角英数で入力してください。")
      end

      it "passwordに全角があれば登録できないこと" do
        @user.password = "あ23456"
        @user.password_confirmation = "あ23456"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password は半角英数で入力してください。")
      end

      it "zenkaku_familynameが空だと登録できないこと" do
        @user.zenkaku_familyname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Zenkaku familyname can't be blank")
      end

      it "zenkaku_familynameに半角が入っていると登録できないこと" do
        @user.zenkaku_familyname = "a山田"
        @user.valid?
        expect(@user.errors.full_messages).to include("Zenkaku familyname は全角で入力してください。")
      end

      it "zenkaku_nameが空だと登録できないこと" do
        @user.zenkaku_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Zenkaku name can't be blank")
      end

      it "zenkaku_nameに半角が入っていると登録できないこと" do
        @user.zenkaku_name = "nil"
        @user.valid?
        expect(@user.errors.full_messages).to include("Zenkaku name は全角で入力してください。")
      end

      it "katakana_family_kanaが空だと登録できないこと" do
        @user.katakana_family_kana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Katakana family kana can't be blank")
      end

      it "katakana_family_kanaに半角が入っていると登録出来ないこと" do
        @user.katakana_family_kana = "aヤマダ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Katakana family kana は全角（カタカナ）で入力してください。")
      end

      it "katakana_name_kanaが空だと登録できないこと" do
        @user.katakana_name_kana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Katakana name kana can't be blank")
      end

      it "katakana_name_kanaに半角が入っていると登録出来ないこと"do
        @user.katakana_name_kana = "aタカ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Katakana name kana は全角（カタカナ）で入力してください。")
      end
    
      it "birthdayが空だと登録できないこと" do
        @user.birthday = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end