class KakaoController < ApplicationController
  def callback
    # 채팅 종류 : MemoChat, DirectChat, MultiChat
    chat_type = params['CHAT_TYPE']
    age = params['age']
    gender = params['gender']
    nickname = params['nickname']
    google_ad_id = params['google_ad_id']

    share_log = { nickname: nickname, google_ad_id: google_ad_id, chat_type: chat_type, age: age, gender: gender, timestamp: Time.now.strftime('%Y-%m-%d %H:%M:%S') }
    BigqueryLogger::KakaoShareLogger.instance.log(share_log)
  end

  def index
  end
end
