.PHONY: install build serve clean

install:
	python -m pip install -r requirements.txt

build:
	zensical build

serve:
	zensical serve

clean:
	rm -rf site .cache
