VENV := .venv
SYSTEM_PYTHON := python3
PYTHON := $(VENV)/bin/python
PIP := $(VENV)/bin/pip
REQUIREMENTS := requirements.txt
APP := view/main.py

.PHONY: install run clean

install:
	$(SYSTEM_PYTHON) -m venv $(VENV)
	$(PIP) install --upgrade pip
	@if [ -f $(REQUIREMENTS) ]; then \
		$(PIP) install -r $(REQUIREMENTS); \
	else \
		echo "Fichier $(REQUIREMENTS) introuvable, dépendances ignorées."; \
	fi
	@echo "Pour lancer le projet: make run"

run: install
	$(PYTHON) $(APP)

clean:
	rm -rf $(VENV)
	rm -rf .pytest_cache .mypy_cache
	find . -type d -name "__pycache__" -prune -exec rm -rf {} +
	find . -type f -name "*.pyc" -delete
