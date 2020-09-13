# Debian package management by Jenkins
# Part 1: Collect debian packages in filesystem tree.
# (Part 2 is private: See git repo "hoertech-aptly" on internal git server)
# New Debian Packages are stored in our storage for debian repositories.
# The storage is cleaned of old packages depending on the current branch.
#
# Usage: 
# BRANCH_NAME=... make -f storage.mk SUPPLY_DIR=.../ PROJECT=... RETENTION=...
#
# See below for parameter explanation. Execute from Jenkins within an aptly
# container with proper volume mount. Configure Jenkins to allow max. 1 aptly
# container for synchronization between project supplies and uploads.
#
# Glossary:
#
# supply:
# The packages stored here have just been built. Location is
# project-specific. For openMHA, it is ./mha/tools/packaging/deb/hoertech/$SYSTEM/
# regardless of $BRANCH_NAME.
# The packages here may be new or they may be rebuilds of
# existing versions (e.g. if someone clicks build-now while
# there is no new revision). Rebuilds of existing versions
# will not be used, but will cause an update of the timestamp of the respective
# files in storage.  New packages are copied to storage
#
# storage:
# The packages here are kept persistently across builds.
# Old packets (timestamp older than some threshold) will be deleted for
# branch development.
# Storage location:
# /var/lib/jenkins/packages-for-aptly/STORAGE/$PROJECT/$BRANCH_NAME/$SYSTEM/
# on the host, which is mounted to /STORAGE/$PROJECT/$BRANCH_NAME/$SYSTEM/
# in the container.
# (container must mount -v /var/lib/jenkins/packages-for-aptly/STORAGE:/STORAGE)
#
# $PROJECT:
# openMHA, liblsl, liblsl-matlab, tascarpro, more may be added
#
# $BRANCH_NAME:
# master, uploaded to apt.hoertech.de, and development, uploaded to
# aptdev.hoertech.de. BRANCH_NAME is set by Jenkins for multibranch pipelines.
#
# SYSTEMs:
# xenial, bionic, jessie, etc. Available SYSTEMs that
# contain packages are detected automatically with $(wildcard)

# There will by $SYSTEM subdirectories below this directory.
# These subdirectories then contain the package files.
SUPPLY_DIR = deb/

# Name of project that created the debs.
PROJECT = hoertech-openmha-keyring

# There will be $SYSTEM subdirectories below this directory.
STORAGE_DIR = /STORAGE/$(PROJECT)/$(BRANCH_NAME)/

# How many days to keep debian packages in storage that are superceded by a
# newer version (only relevant for branch development)
RETENTION = 14

storage: pruned-storage-$(BRANCH_NAME)

# Delete debian packages in storage older than RETENTION days
pruned-storage-%: updated-storage-%
	@echo uuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuu
	@echo Begin pruning storage...
	@echo nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn
	find $(STORAGE_DIR) -name "*.deb" -type f -mtime +$(RETENTION) -delete -print
	-rmdir $(STORAGE_DIR)/*   #  delete empty subdirs if there are any
	@echo uuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuu
	@echo Storage pruning finished.
	@echo nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn

# Never delete old packages in the master database
pruned-storage-master: updated-storage-master
	@echo uuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuu
	@echo "Keep all existing packages on branch master"
	@echo nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn

# copy the $SYSTEM/packages.deb tree without overwriting existing package files.
# then, update the timestamps for all files that are now in the supply to
# prevent deletion of latest files because they might be too old.
updated-storage-$(BRANCH_NAME):
	@echo uuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuu
	@echo Begin updating storage...
	@echo nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn
	mkdir -p $(STORAGE_DIR)
	cp -anv $(SUPPLY_DIR)* $(STORAGE_DIR)
	cd $(SUPPLY_DIR) && find . -name \*.deb -exec touch $(STORAGE_DIR){} \;
	@echo uuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuu
	@echo Storage update finished.
	@echo nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn


# Local Variables:
# coding: utf-8-unix
# End:
