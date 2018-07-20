# frozen_string_literal: true

module Phinspector
  # Command that initializes the Phinspector execution.
  class Init < ::Escort::ActionCommand::Base
    def execute
      puts command_options[:working_dir]
    end
  end
end
