
#-------------------------------------------------------------------------------

.software_merge_master_from_all_branches() {
	git checkout master
	git add .
	git commit

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
	git merge master && git commit -m 'merge master'
}

#-------------------------------------------------------------------------------

.software_list() {
	git branch | while read LINE
		do
			BRANCH=${LINE/* /}

			if [ "$BRANCH" != "master" ]; then
				echo $BRANCH
			fi
		done
}

#-------------------------------------------------------------------------------

