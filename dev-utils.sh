
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

