if Rails.env.production?
  CarrierWave.configure do |config|
    config.fog_credentials = {
      :provider              => 'AWS',
      :region                => 'ap-northeast-1',
      :aws_access_key_id     => Rails.application.credentials.aws[:access_key_id],
      :aws_secret_access_key => Rails.application.credentials.aws[:secret_access_key]
    }
    config.fog_directory     =  'sr-share-jh178bz'
  end
end
