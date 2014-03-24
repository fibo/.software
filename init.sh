
# Define and create .software folders

DOTSOFTWARE_HOME_DIR=${DOTSOFTWARE_HOME_DIR:-~/.software}
mkdir -p $DOTSOFTWARE_HOME_DIR
export DOTSOFTWARE_HOME_DIR

DOTSOFTWARE_ROOT_DIR=${DOTSOFTWARE_ROOT_DIR:-~/.software}
mkdir -p $DOTSOFTWARE_ROOT_DIR
export DOTSOFTWARE_ROOT_DIR

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

	function _get_sources() {
		cd $SOURCES_DIR
		wget -N $SOURCES_URI
	}

	function _read_sources_filename() {
		cd $SOURCES_DIR
		SOURCES_FILENAME=$(basename $SOURCES_URI)
	}

	function _read_current_version_dir() {
		cd $SOURCES_DIR
		CURRENT_VERSION_DIR=$(tar tzf $SOURCES_FILENAME | head -1)
	}

	function _extract() {
		cd $BUILD_DIR
		tar xzf $SOURCES_DIR/$SOURCES_FILENAME
	}

	function _build() {
		cd $CURRENT_VERSION_DIR
		./configure --prefix=$BASE_DIR/$CURRENT_VERSION_DIR && make install
	}

	function _link_it() {
		cd $BASE_DIR
		rm current 2> /dev/null
		ln -s $CURRENT_VERSION_DIR current
	}

	source $DOTSOFTWARE_HOME_DIR/$SOFTWARE_NAME/installrc

	_get_sources
	_read_sources_filename
	_read_current_version_dir
	_extract
	_build
	_link_it

	# Go back to starting dir.
	popd 1> /dev/null

	# Cleanup variables and functions.
	unset BASE_DIR
	unset BUILD_DIR
	unset CURRENT_VERSION_DIR
	unset INSTALL_DIR
	unset SOFTWARE_NAME
	unset SOURCES_DIR
	unset SOURCES_FILENAME
	unset SOURCES_URI

	unset _build
	unset _extract
	unset _get_sources
	unset _link_it
	unset _read_current_version_dir
}

