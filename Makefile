all:
	make jenkins

jenkins:
	rm -rf tmp/
	find . | grep -viE '/.git'
	find . -iname '*.pp' | xargs puppet parser validate
	echo -e '\n\n\n'
	git clone . tmp/lockss/
	git clone git@github.ugent.be:Universiteitsbibliotheek/pm_motd.git   tmp/motd/
	git clone git@github.ugent.be:Universiteitsbibliotheek/pm_concat.git tmp/concat/
	cd tmp/lockss; if [ -d spec ]; then rspec; fi
	rm -rf tmp/
