.PHONY: build install publish clean 

clean:
	rm -rf build dist *.egg-info
	pip uninstall seq-mutator -y

build:
	python3 setup.py sdist bdist_wheel

install:
	pip install .

publish_test:
	twine upload --repository testpypi dist/*

publish:
	twine upload dist/*


