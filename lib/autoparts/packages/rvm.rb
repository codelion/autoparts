module Autoparts
  module Packages
    class Rvm < Package
      name 'rvm'
      version '1.25.18'
      description 'RVM is a command-line tool which allows you to easily install, manage, and work with multiple ruby environments from interpreters to sets of gems.'
      source_url 'https://github.com/wayneeseguin/rvm/tarball/1.25.18'
      source_sha1 '6bee4ae077256e2e2b0e71e1eaad7a08421eb7e0'
      source_filetype 'tar.gz'

      def install
        Dir.chdir(extracted_archive_path) do
          prefix_path.mkpath
          # Use a single arg for shell expansion of command parameters.
          execute 'mv wayne*/* ./'
          execute "./install --auto-dotfiles --path #{prefix_path}"
          symlink_stable
        end
      end

     def symlink_stable
       File.symlink(prefix_path, Path.packages + name + "stable")
     end
    end
  end
end
