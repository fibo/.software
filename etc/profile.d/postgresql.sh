if [ -z "$PGDATA" ]; then
	export PGDATA=$DOTSOFTWARE_ROOT_DIR/opt/pgsql/data
fi

alias start_postgresql='pg_ctl -l $PGDATA/postmaster.log start'
alias stop_potgresql='pg_ctl stop'
