.PHONY: dev tags test

dev: tags test

tags:
	@find . -name "*.py" | grep -v "\.\#" | etags --output TAGS -
	@echo [dev]: regenerated tags

test: test2 test3

test2:
	nosetest2 
test3:
	nosetest3

push-git:
	git push cyborg
	git push github
	git push github-tychoish

setup-git:
	git remote add cyborg gitosis@git.cyborginstitute.net:rstcloth.git
	git remote add github git@github.com:cyborginstitute/rstcloth.git
	git remote add github-tychoish git@github.com:tychoish/rstcloth.git

release:push-git
	python setup.py sdist upload

