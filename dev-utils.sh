
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
	git branch -a | grep -v master | cut -d / -f3
>>>>>>> master
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

			if [ "$BRANCH" != "master" ]; then
				echo $BRANCH
			fi
		done
}

#-------------------------------------------------------------------------------

