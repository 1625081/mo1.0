# encoding: utf-8

CarrierWave.configure do |config|
  config.storage             = :qiniu
  config.qiniu_access_key    = "fI_SlRH65ysNGJ1tj4NT4BL0yvMqmmQuNfzjYu-N"
  config.qiniu_secret_key    = 'qKjuEaDZtvN0x734nr0pEcpkmQ42nT0iL0P_-qvE'
end