
SOFTWARE_ROOT_DIR=${SOFTWARE_ROOT_DIR:-~/opt}
mkdir -p $SOFTWARE_ROOT_DIR
export SOFTWARE_ROOT_DIR=$SOFTWARE_ROOT_DIR


#-------------------------------------------------------------------------------

.software() {

	DOTSOFTWARE_DIR=~/.software

	lowercase() {
		echo $1 | tr '[A-Z]' '[a-z]'
	}

	uppercase() { 
		echo $1 | tr '[a-z]' '[A-Z]'
	}

        STARTING_DIR=$PWD

	NAME=$1
	if [ -z "$NAME" ]; then
		echo USAGE: .software NAME
		return 1
	fi

	if [ ! -d $DOTSOFTWARE_DIR/$NAME ]; then
		echo Unknown software: $NAME
		return 1
	fi
 
	_create() {
		KEY=$(lowercase $1)
		FILE=$DOTSOFTWARE_DIR/$NAME/_$KEY

		touch $FILE

		unset KEY
		unset FILE
	}

	_read() {
		KEY=$(lowercase $1)
		FILE=$DOTSOFTWARE_DIR/$NAME/_$KEY

		if [ ! -e $FILE ]; then
			echo Unable to read $KEY value for software $NAME
			return 1
		fi

		VALUE=$(cat $FILE)
		KEY=$(uppercase $1)

		eval $KEY='$'VALUE

		unset KEY
		unset VALUE
		unset FILE
	}

	_update() {
		KEY=$(lowercase $1)
		VALUE=$2
		FILE=$DOTSOFTWARE_DIR/$NAME/_$KEY

		if [ ! -e $FILE ]; then
			_create $KEY	
		fi

		echo $VALUE > ~/.software.d/$NAME/_$KEY

		unset KEY
		unset VALUE
		unset FILE
	}

	_delete() {
		KEY=$(lowercase $1)
		FILE=$DOTSOFTWARE_DIR/$NAME/_$KEY

		rm $FILE

		unset KEY
		unset FILE
	}

	ROOT_DIR=$SOFTWARE_ROOT_DIR/$NAME
	mkdir -p $ROOT_DIR

	mkdir -p $ROOT_DIR/sources
	mkdir -p $ROOT_DIR/build

	#INSTALL_DIR=$ROOT_DIR/$SOURCES_FILENAME
	#mkdir -p $INSTALL_DIR

	# Execute scripts.
	# Naming convention for scripts is
	#
	#     <i>_<name>
	#
	# where <i> is a digit that indicates the execution order.
	ls ~/.software.d/$NAME/[0-9]_* | while read SCRIPT
	do
		source $SCRIPT
	done

	# Go back to starting dir.
	cd $STARTING_DIR

	# Cleanup variables and functions.
	unset STARTING_DIR
	unset SOURCES_URI
	unset INSTALL_DIR
	unset NAME
	unset SOURCE_URI

	unset lowercase
	unset uppercase
	unset _read
	unset _create
	unset _update
	unset _delete
}

