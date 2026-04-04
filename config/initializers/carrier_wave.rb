# frozen_string_literal: true

# 今はAWS S3を使わないので、この設定は一旦オフにするじぇ！
# if Rails.env.production?
#   CarrierWave.configure do |config|
#     config.storage = :file # 本番でもディスクに保存する場合（※Renderでは再起動で消える点に注意）
#   end
# end
