require File.dirname(__FILE__) + '/../capistrano-helpers' if ! defined?(CapistranoHelpers)

CapistranoHelpers.with_configuration do

  desc "Ensure that a branch has been selected."
  task :set_branch do
    if !exists?(:branch)
      input = Capistrano::CLI.ui.ask("Which tag/branch/commit? [HEAD] ")
      set(:branch, input && !input.empty? || "HEAD")
    end
  end

  on :start, :set_branch

end
