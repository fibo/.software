
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
	pushd $DOTSOFTWARE_HOME_DIR 1> /dev/null

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
	popd 1> /dev/null

	# Cleanup variables and functions.
	unset BASE_DIR
	unset SOURCES_DIR
	unset BUILD_DIR
	unset INSTALL_DIR
	unset SOFTWARE_NAME
}

