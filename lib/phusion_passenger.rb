#  Phusion Passenger - http://www.modrails.com/
#  Copyright (c) 2010 Phusion
#
#  "Phusion Passenger" is a trademark of Hongli Lai & Ninh Bui.
#
#  Permission is hereby granted, free of charge, to any person obtaining a copy
#  of this software and associated documentation files (the "Software"), to deal
#  in the Software without restriction, including without limitation the rights
#  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
#  copies of the Software, and to permit persons to whom the Software is
#  furnished to do so, subject to the following conditions:
#
#  The above copyright notice and this permission notice shall be included in
#  all copies or substantial portions of the Software.
#
#  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
#  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
#  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
#  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
#  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
#  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
#  THE SOFTWARE.

module PhusionPassenger
	###### Version numbers ######
	
	# Phusion Passenger version number. Don't forget to edit ext/common/Constants.h too.
	VERSION_STRING = '2.9.1'
	
	PREFERRED_NGINX_VERSION = '0.7.65'
	PREFERRED_PCRE_VERSION  = '8.01'
	LITE_INTERFACE_VERSION  = 1
	
	
	###### Directories ######
	# Don't forget to modify ext/common/ResourceLocator.h too.
	
	# Returns whether this Phusion Passenger installation is packaged
	# using the OS's native package management system, i.e. as opposed
	# to being installed from source or with RubyGems.
	def self.natively_packaged?
		if !defined?(@natively_packaged)
			@natively_packaged = !File.exist?("#{LIBDIR}/../Rakefile") ||
			                     !File.exist?("#{LIBDIR}/../DEVELOPERS.TXT")
		end
		return @natively_packaged
	end
	
	NATIVELY_PACKAGED_SOURCE_ROOT        = "/usr/share/phusion-passenger/source"
	NATIVELY_PACKAGED_NATIVE_SUPPORT_DIR = "/usr/lib/phusion-passenger/native_support/#{VERSION_STRING}"
	NATIVELY_PACKAGED_DOCDIR             = "/usr/share/doc/phusion-passenger"
	NATIVELY_PACKAGED_AGENTS_DIR         = "/usr/lib/phusion-passenger/agents"
	NATIVELY_PACKAGED_HELPER_SCRIPTS_DIR = "/usr/share/phusion-passenger/helper-scripts"
	
	# Directory containing the Phusion Passenger Ruby libraries.
	LIBDIR         = File.expand_path(File.dirname(__FILE__))
	
	# Directory containing templates.
	TEMPLATES_DIR  = File.join(LIBDIR, "phusion_passenger", "templates")
	
	# Subdirectory under $HOME to use for storing resource files.
	LOCAL_DIR      = ".passenger"
	
	# Directories in which to look for plugins.
	PLUGIN_DIRS    = ["/usr/share/phusion-passenger/plugins",
		"/usr/local/share/phusion-passenger/plugins",
		"~/#{LOCAL_DIR}/plugins"]
	
	if !natively_packaged?
		# Top directory of the Phusion Passenger source code.
		SOURCE_ROOT        = File.expand_path(File.join(LIBDIR, ".."))
		
		# Directory containing native_support.so.
		NATIVE_SUPPORT_DIR = File.join(SOURCE_ROOT, "ext", "phusion_passenger")
		
		# Documentation directory.
		DOCDIR             = File.join(SOURCE_ROOT, "doc")
		
		# Directory containing Phusion Passenger agent executables.
		AGENTS_DIR         = File.join(SOURCE_ROOT, "agents")
		
		# Directory containing Phusion Passenger helper scripts.
		HELPER_SCRIPTS_DIR = File.join(SOURCE_ROOT, "helper-scripts")
	else
		SOURCE_ROOT        = NATIVELY_PACKAGED_SOURCE_DIR
		NATIVE_SUPPORT_DIR = NATIVELY_PACKAGED_NATIVE_SUPPORT_DIR
		DOCDIR             = NATIVELY_PACKAGED_DOCDIR
		AGENTS_DIR         = NATIVELY_PACKAGED_AGENTS_DIR
		HELPER_SCRIPTS_DIR = NATIVELY_PACKAGED_HELPER_SCRIPTS_DIR
	end
	
	
	###### Other resource locations ######
	
	LITE_BINARIES_URL_ROOT  = "http://lite-binaries.modrails.com"
	
	
	if $LOAD_PATH.first != LIBDIR
		$LOAD_PATH.unshift(LIBDIR)
		$LOAD_PATH.uniq!
	end
end if !defined?(PhusionPassenger::LIBDIR)