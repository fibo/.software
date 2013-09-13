
#-------------------------------------------------------------------------------

# Define and create .software folders

DOTSOFTWARE_ROOT_DIR=${DOTSOFTWARE_ROOT_DIR:-~/opt}
mkdir -p $DOTSOFTWARE_ROOT_DIR || exit 1
export DOTSOFTWARE_ROOT_DIR

DOTSOFTWARE_HOME_DIR=${DOTSOFTWARE_HOME_DIR:-~/.software}
mkdir -p $DOTSOFTWARE_HOME_DIR || exit 1
export DOTSOFTWARE_HOME_DIR

#-------------------------------------------------------------------------------

.software_install() {

	# cd info DOTSOFTWARE_HOME_DIR
	pushd $DOTSOFTWARE_HOME_DIR

	SOFTWARE_NAME=$1

	# Require parameter
	if [ -z "$SOFTWARE_NAME" ]; then
		echo USAGE: .software_install Foo
	return 1
	fi

	# Check that SOFTWARE_NAME dir exists
	if [ ! -d $DOTSOFTWARE_HOME_DIR/$SOFTWARE_NAME ]; then
		echo Unknown software: $SOFTWARE_NAME
		return 1
	fi

	BASE_DIR=$DOTSOFTWARE_ROOT_DIR/$SOFTWARE_NAME
	mkdir -p $BASE_DIR
	export BASE_DIR

	BUILD_DIR=$BASE_DIR/build
	mkdir -p $BUILD_DIR
	export BUILD_DIR

	SOURCES_DIR=$BASE_DIR/sources
	mkdir -p $SOURCES_DIR
	export SOURCES_DIR

	bash $DOTSOFTWARE_HOME_DIR/$SOFTWARE_NAME/install.sh

	# Go back to starting dir.
	popd

	# Cleanup variables and functions.
	unset BASE_DIR
	unset SOURCES_DIR
	unset BUILD_DIR
	unset INSTALL_DIR
	unset SOFTWARE_NAME
}

#-------------------------------------------------------------------------------

.software_push_all_branches() {
	.software_list | while read BRANCH
		do
			git checkout $BRANCH
			git push origin $BRANCH
		done

	git checkout master
	git push origin master
}

#-------------------------------------------------------------------------------

.software_checkout_all_branches_from_origin() {
	.software_list_origin_branches | while read BRANCH
		do
			.software_checkout_origin_branch $BRANCH
		done

	git checkout master
	git branch
}

#-------------------------------------------------------------------------------

.software_checkout_origin_branch() {
	BRANCH=$1

	git checkout -b $BRANCH origin/$BRANCH
}

#-------------------------------------------------------------------------------

.software_list_origin_branches() {
	git branch -a | grep -v master | grep -v local | cut -d / -f3
}

#-------------------------------------------------------------------------------

.software_merge_master_from_all_branches() {
	.software_list | while read BRANCH
		do
			.software_merge_master_from_branch $BRANCH
		done

	git checkout master
}

#-------------------------------------------------------------------------------

.software_merge_master_from_branch() {
	BRANCH=$1

	git checkout $BRANCH || return 1
	git merge master
}

#-------------------------------------------------------------------------------

.software_list() {
	git branch | while read LINE
		do
			BRANCH=${LINE/* /}

			if [ "$BRANCH" != "master" ] && [ "$BRANCH" != "local" ]; then
				echo $BRANCH
			fi
		done
}

#-------------------------------------------------------------------------------

