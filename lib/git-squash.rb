require 'colored'
require 'grit'
require 'git-squash/version'

class GitSquash
  attr_accessor :argv

  def run(argv)
    @argv = argv
    reset_command
    add_command
    commit_command
    push_force_command
  end

  private

  def push_force_command
    puts "Executing push command".green
    puts "git push origin -f #{ current_branch }".yellow
    puts
    %x(git push origin -f #{ current_branch })
  end

  def commit_command
    puts "Executing commit command".green
    puts "git commit -S -am #{ message }".yellow
    puts
    %x(git commit -S -am "#{ message }")
  end

  def add_command
    puts "Executing add command".green
    puts "git add .".yellow
    puts
    %x(git add .)
  end

  def reset_command
    puts "Executing reset command from: #{ from_branch }".green
    puts "git reset --soft #{ commit_id }".yellow
    %x(git reset --soft #{ commit_id })
  end

  def commit_id
    %x(git merge-base HEAD #{ from_branch })
  end

  def current_branch
    @current_branch ||= repo.head.name
  end

  def repo
    @repo ||= get_repo
  end

  def from_branch
    @argv[1] || 'master'
  end

  def message
    @argv[0] || 'no commit message'
  end

  def get_repo
    repo_dir = `git rev-parse --show-toplevel`.chomp
    begin
      @repo = Grit::Repo.new(repo_dir)
    rescue
      raise "We don't seem to be in a git repository."
    end
  end
end