
DOTSOFTWARE_ROOT_DIR=${DOTSOFTWARE_ROOT_DIR:-~/opt}
mkdir -p $DOTSOFTWARE_ROOT_DIR
export DOTSOFTWARE_ROOT_DIR=$DOTSOFTWARE_ROOT_DIR

DOTSOFTWARE_HOME_DIR=${DOTSOFTWARE_ROOT_DIR:-~/.software}
export DOTSOFTWARE_HOME_DIR=~/.software

#-------------------------------------------------------------------------------

.software() {
    .software_install $*
}

#-------------------------------------------------------------------------------

.software_install() {

	STARTING_DIR=$PWD

	NAME=$1
	if [ -z "$NAME" ]; then
		echo USAGE: .software NAME
	return 1
	fi

	if [ ! -d $DOTSOFTWARE_HOME_DIR/$NAME ]; then
		echo Unknown software: $NAME
		return 1
	fi

	BASE_DIR=$DOTSOFTWARE_ROOT_DIR/$NAME
	mkdir -p $BASE_DIR
	export BASE_DIR

	BUILD_DIR=$BASE_DIR/build
	mkdir -p $BUILD_DIR
	export BUILD_DIR

	SOURCES_DIR=$BASE_DIR/sources
	mkdir -p $SOURCES_DIR
	export SOURCES_DIR

	$DOTSOFTWARE_HOME_DIR/$NAME/install.sh

	# Go back to starting dir.
	cd $STARTING_DIR

	# Cleanup variables and functions.
	unset STARTING_DIR
	unset BASE_DIR
	unset SOURCES_DIR
	unset BUILD_DIR
	unset INSTALL_DIR
	unset NAME
}

