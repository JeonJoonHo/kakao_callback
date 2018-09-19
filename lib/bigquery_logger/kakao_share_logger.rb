require 'singleton'

module BigqueryLogger
  class KakaoShareLogger
    include Singleton

    DEFAULT_BQ_LOG_FILE_NAME = 'kakaoShare.log'
    DEFAULT_BQ_FOLDER_PATH = 'log/es_log/'

    def initialize(folder_path= DEFAULT_BQ_FOLDER_PATH, log_name=DEFAULT_BQ_LOG_FILE_NAME)
      ActiveSupport::JSON.initialize
      @log_path = folder_path + log_name
      unless File.exist? @log_path
        FileUtils::mkdir_p folder_path
        File.open(@log_path, 'w').close
      end
      @logger = ActiveSupport::BufferedLogger.new(@log_path)
    end

    private
    def log(json_log)
      log_data = ActiveSupport::JSON.stringify(json_log)
      @logger.info log_data
    rescue => e
      puts('error')
    end
  end
end