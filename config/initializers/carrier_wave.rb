if Rails.env.production?
  CarrierWave.configure do |config|
    config.fog_credentials = {
      # Amazon S3用の設定
      :provider               => 'AWS',
      :region                 => 'ap-northeast-1',
      :aws_access_key_id      => 'AKIAR2EPABVDV7MHFBIA',
      :aws_secret_access_key  => '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'
    }
    config.fog_directory      =  'bipapa'
  end
end
