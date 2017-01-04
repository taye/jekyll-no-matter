#          DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
#                  Version 2, December 2004
#
#          DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
# TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION 
#
# 0. You just DO WHAT THE FUCK YOU WANT TO.

module JekyllNoMatter
  VERSION = "0.0.0.pre"
end

module Jekyll
  class Reader
    # same as the original method except that files whose endings match any of those
    # listed in `@site.config["no_matter"]` will be processed even without
    # front matter
    def read_directories(dir = "")
      base = site.in_source_dir(dir)

      dot = Dir.chdir(base) { filter_entries(Dir.entries("."), base) }
      dot_dirs = dot.select { |file| File.directory?(@site.in_source_dir(base, file)) }
      dot_files = (dot - dot_dirs)
      dot_pages = dot_files.select do |file|
        Utils.has_yaml_header?(@site.in_source_dir(base, file)) ||
          # this is where the interesting is
          (@site.config["no_matter"] || []).index { |ext| file.index(ext) == file.length - ext.length }
      end
      dot_static_files = dot_files - dot_pages

      retrieve_posts(dir)
      retrieve_dirs(base, dir, dot_dirs)
      retrieve_pages(dir, dot_pages)
      retrieve_static_files(dir, dot_static_files)
    end
  end
end
