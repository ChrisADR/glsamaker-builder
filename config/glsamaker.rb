# GLSAMaker local configuration
# rename this file to glsamaker.rb

# The development environment uses self-issued HTTP basic authentication
# Since GLSAMaker doesn't track passwords, set a password here for usage e.g.
# in ./script/server testing environments. The password applies to every user
GLSAMAKER_DEVEL_PASSWORD = "glsamaker"

# If you want to force GLSAMaker to use production-style auth in all
# environments, set this to true
GLSAMAKER_FORCE_PRODUCTION_AUTH = true 

# Email address of the administrative contact
GLSAMAKER_ADMIN_EMAIL = "security@gentoo.org"

# Email address to send email from
GLSAMAKER_FROM_EMAIL = "glsamaker@gentoo.org"

# Do not send any emails (for development)
GLSAMAKER_NO_EMAIL = true 

# Where does the app live?
GLSAMAKER_HOST = "localhost:3000"

# Location of the Portage tree, that can be a full gentoo tree, or what this gets you:
#
# rsync -av rsync://rsync1.de.gentoo.org/gentoo-portage --include 'metadata' \
#  --include 'metadata/**' --include '*/*/metadata.xml' --exclude '*/*/*' \
#  --exclude scripts --exclude eclass --exclude profiles --exclude 'skel.*' \
#  --exclude 'header.txt' --exclude 'licenses' /target
#
GLSAMAKER_PORTDIR = "/usr/portage/"

# Bugzilla login info
GLSAMAKER_BUGZIE_SKIP = false
GLSAMAKER_BUGZIE_HOST = 'bugs.gentoo.org'
GLSAMAKER_BUGZIE_USER = nil
GLSAMAKER_BUGZIE_PW = nil

# Location of xmlindent(1)
GLSAMAKER_XMLINDENT = "/usr/bin/xmlindent"

# Your secret key for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!
# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# Yes, this is referencing an undefined variable on purpose.
Glsamaker::Application.config.secret_token = 111111111122222222223333333333
