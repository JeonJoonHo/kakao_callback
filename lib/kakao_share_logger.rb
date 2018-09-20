require 'singleton'

class KakaoShareLogger
  include Singleton

  DEFAULT_BQ_LOG_FILE_NAME = 'kakaoShare.log'
  DEFAULT_BQ_FOLDER_PATH = 'log/es_log/'

  def initialize(folder_path= DEFAULT_BQ_FOLDER_PATH, log_name=DEFAULT_BQ_LOG_FILE_NAME)
    @log_path = folder_path + log_name
    unless File.exist? @log_path
      FileUtils::mkdir_p folder_path
      File.open(@log_path, 'w').close
    end
    @logger = ActiveSupport::TaggedLogging.new(Logger.new(@log_path))
  end

  def log(json_log)
    log = JSON.parse json_log.to_json
    @logger.info log
  rescue => e
    puts("error => #{e}")
  end
end