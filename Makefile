PY ?= .venv/bin/python

.PHONY: install test lint generate demo fonts

install:
	python3 -m venv .venv
	$(PY) -m pip install --require-hashes -r requirements-dev.txt

test:
	$(PY) -m pytest -q -o addopts=--tb=short

lint:
	$(PY) -m compileall -q generator tools tests

generate:
	$(PY) -m generator.main

demo:
	$(PY) -m generator.main --demo

fonts:
	$(PY) -m pip install -r requirements-fonts.txt
	$(PY) tools/build_font_atlas.py
